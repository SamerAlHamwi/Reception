import 'dart:ffi';
import 'dart:io';

import 'package:ministries_reception_app/core/utils/navigation.dart';
import 'package:ministries_reception_app/core/utils/shared_storage.dart';

import '../../../core/api/core_models/base_result_model.dart';
import '../../../core/api/data_source/remote_data_source.dart';
import '../../../core/api/http/api_urls.dart';
import '../../../core/api/http/http_method.dart';
import '../../../core/notification/data/fcm_notification_model.dart';
import '../../../core/notification/domin/cubit/notification_cubit.dart';
import '../../../core/notification/domin/notification_middleware.dart';
import '../../../core/notification/notification.dart';
import '../../../core/notification/signal_r.dart';
import '../../../core/utils/print/print.dart';
import '../data/login_request_model.dart';
import '../data/login_response_model.dart';

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
      SignalR().start(onReceived: (data) {
        var notification =
            FCMNotificationModel.fromSignalR(data as Map<String, dynamic>);
        NotificationMiddleware.onRceived(notification);
      });
      if (Platform.isAndroid || Platform.isMacOS || Platform.isIOS) {
        await Messaging.initFCM();
        await NotificationCubit.updateFCMToken(Messaging.token);
      }
      if (Messaging.token == null) {
        Print.showSnackBar(
          message: 'Your device is not supported by Google services',
        );
      } else {
        if (res == false) {
          Print.showErrorSnackBar(
              message: 'Error occurred while sending fcm token');
          SharedStorage.writeToken(null);
          SharedStorage.writeIsInCall(false);
        }
      }
    }
    return res;
  }
}
