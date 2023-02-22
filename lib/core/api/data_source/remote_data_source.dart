import 'package:flutter/cupertino.dart';
import '../../../core/constants/constant.dart';
import '../../../core/utils/shared_storage.dart';
import 'package:dio/dio.dart';
import '../../../features/auth/presentation/pages/login_page.dart';
import '../../utils/navigation.dart';
import '../core_models/base_result_model.dart';
import '../errors/unauthorized_error.dart';
import '../http/api_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

 class RemoteDataSource {
   
  static Future request<Response extends BaseResultModel>({
    required Response Function(Map<String, dynamic> json) converter,
    required String method,
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String,String>? files,
    bool withAuthentication = true,
    CancelToken? cancelToken,
    bool isLongTime = false,
    bool isLaravel = false
  }) async {

    Map<String, String> headers= {
      "Content-Type" : "application/json",
      "accept" : "application/json",
    };

    /// Get the language.
    String lang = SharedStorage.getLanguage();
    headers.putIfAbsent("Accept-Language", () => lang);


    if (withAuthentication) {
      if (SharedStorage.hasToken()) {
        headers.putIfAbsent("authorization", () => ('bearer ${SharedStorage.getToken()}'));
      } else{
        return UnauthorizedError();
      }


    }
    // Send the request.
    final response = await ApiProvider.sendObjectRequest<Response>(
      method: method,
      url:   url,
      converter: converter,
      headers: headers,
      queryParameters: queryParameters ?? {},
      data: data??{},
      files: files,
      isLongTime:isLongTime,
      cancelToken: cancelToken,
      isLaravel:isLaravel
    );

    if (response.success!) {
      return response.result!;
    }
    else
    {
      if(response.serverError != null){

        if(response.error is UnauthorizedError){
         logOut();
        }
        return response.serverError;
      }

      else {
        return response.error;
      }
    }
  }


  static logOut() {
    SharedStorage.removeToken();
    EasyLoading.dismiss();
//    todo logout
    Navigation.pushAndRemoveUntil(Keys.scaffoldKey.currentContext!,LoginPage());
  }
 }
