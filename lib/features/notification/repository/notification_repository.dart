
import '../../../../core/api/core_models/base_result_model.dart';
import '../../../../core/api/data_source/remote_data_source.dart';
import '../../../../core/api/http/api_urls.dart';
import '../../../../core/api/http/http_method.dart';
import '../../../core/api/core_models/empty_model.dart';
import '../data/notification_list_response_model.dart';
class NotificationRepository {
  static Future<BaseResultModel> notificationList(data) async {
    return await RemoteDataSource.request<NotificationListResponseModel>(
      converter: (json) => NotificationListResponseModel.fromJson(json),
      method: HttpMethod.get,
      queryParameters: data.toJson(),
      withAuthentication: true,
      url: ApiURLs.getAllNotification,
    );
  }
  static Future<BaseResultModel> uploadNotificationsToken(String? token) async {
    return await RemoteDataSource.request<EmptyModel>(
      converter: (json) => EmptyModel.fromJson(json),
      method: HttpMethod.post,
      queryParameters: {"input": token},
      withAuthentication: true,
      url: ApiURLs.setTokenNotification,
    );
  }
}