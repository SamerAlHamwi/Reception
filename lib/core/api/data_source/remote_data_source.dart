import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:ministries_reception_app/core/utils/navigation.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';
import 'package:ministries_reception_app/features/auth/presentation/pages/login_page.dart';

import '../../constants/app_constants.dart';
import '../core_models/base_result_model.dart';
import '../errors/unauthorized_error.dart';
import '../http/api_provider.dart';

class RemoteDataSource {
  static Future request<Response extends BaseResultModel>({
    required Response Function(Map<String, dynamic> json) converter,
    required String method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String>? files,
    bool withAuthentication = true,
    CancelToken? cancelToken,
    bool uploadNotification = false,
    bool downloadNotification = false,
    bool isLongTime = false,
    bool isLaravel = false,
    int retries = 0,
  }) async {
    Map<String, String> headers = {
      HEADER_CONTENT_TYPE: "application/json",
      HEADER_ACCEPT: "application/json",
      // HEADER_CONTENT_TYPE:"application/json",
      // HEADER_ACCEPT: "application/json",
      //
      // // "Transfer-Encoding": "chunked",
      // // "Access-Control-Allow-Origin": "*",
      // // "Content-Encoding": "gzip",
      // // "Vary": "Authorization, Accept-Encoding",
      //
    };

    /// Get the language.
    String lang = SharedStorage.getLanguage();
    headers.putIfAbsent(HEADER_LANGUAGE, () => lang);

    if (withAuthentication) {
      if (SharedStorage.hasToken()) {
        headers.putIfAbsent(
            HEADER_AUTH, () => ('bearer ${SharedStorage.getToken()}'));
      } else {
        logOut();
        return UnauthorizedError();
      }
    }
    // Send the request.
    final response = await ApiProvider.sendObjectRequest<Response>(
        method: method,
        url: url,
        downloadNotification: downloadNotification,
        uploadNotification: uploadNotification,
        converter: converter,
        headers: headers,
        queryParameters: queryParameters ?? {},
        data: data ?? {},
        files: files,
        isLongTime: isLongTime,
        cancelToken: cancelToken,
        isLaravel: isLaravel,
        retries: retries);
    if (response.success!) {
      return response.result!;
    } else {
      if (response.serverError != null) {
        if (response.serverError!.message != null &&
            (response.serverError!.message!
                    .contains("There is no entity User with id") ||
                response.serverError!.message!.contains("لا يوجد كيان"))) {
          logOut();
        }

        if (response.error is UnauthorizedError) {
          logOut();
        }
        return response.serverError;
      } else {
        return response.error;
      }
    }
  }

  static logOut() {
    SharedStorage.removeToken();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    Navigation.pushAndRemoveUntil(
        Keys.navigatorKey.currentContext!, LoginPage());
    // Navigation.pushAndRemoveUntil(const LoginPage());
  }
}
