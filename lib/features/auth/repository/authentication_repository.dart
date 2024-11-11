import 'dart:io';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../core/api/core_models/base_result_model.dart';
import '../../../core/api/data_source/remote_data_source.dart';
import '../../../core/api/http/api_urls.dart';
import '../../../core/api/http/http_method.dart';
import '../../../core/notification/domin/cubit/notification_cubit.dart';
import '../../../core/notification/notification.dart';
import '../../app_update/data/app_update_model.dart';
import '../../app_update/data/app_update_request.dart';
import '../data/login_request_model.dart';
import '../data/login_response_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthenticationRepository {

  static Future<BaseResultModel> authenticateLogIn(
      LoginRequestModel loginRequestModel) async {
    final res = await RemoteDataSource.request<LoginResponseModel>(
      converter: (json) => LoginResponseModel.fromJson(json),
      method: HttpMethod.post,
      data: loginRequestModel.toJson(),
      withAuthentication: false,
      url: ApiURLs.loginURL,
    );
    if (res is LoginResponseModel) {
      SharedStorage.writeToken(res.accessToken);
      SharedStorage.writeUserType(res.userType);
      if(!kIsWeb)
     { if (Platform.isAndroid || Platform.isMacOS || Platform.isIOS) {
        await Messaging.initFCM();
        await NotificationCubit.updateFCMToken(Messaging.token);
      }}
    }
    return res;
  }

  static Future<BaseResultModel> checkAppUpdate() async {

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String buildNumber = packageInfo.buildNumber;

    int number = int.tryParse(buildNumber) ?? 1;


    AppUpdateRequestModel appUpdateRequestModel = AppUpdateRequestModel(
      appType: 1,
      buildNumber: number,
    );

    final res = await RemoteDataSource.request<AppUpdateModel>(
      converter: (json) => AppUpdateModel.fromJson(json),
      method: HttpMethod.get,
      queryParameters: appUpdateRequestModel.toJson(),
      withAuthentication: false,
      url: ApiURLs.updateUrl,
    );
    return res;
  }

}
