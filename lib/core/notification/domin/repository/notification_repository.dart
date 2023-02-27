import '../../../api/core_models/base_result_model.dart';
import '../../../api/core_models/empty_model.dart';
import '../../../api/data_source/remote_data_source.dart';
import '../../../api/http/api_urls.dart';
import '../../../api/http/http_method.dart';

class NotificationRepository {

  static Future<BaseResultModel> updateFCMToken(String? token) async {
    var res = await RemoteDataSource.request<EmptyModel>(
        converter: (json) => EmptyModel.fromJson(json),
        method: HttpMethod.post,
        withAuthentication: true,
        queryParameters: {'input': token},
        url: ApiURLs.setTokenNotification);
    return res;
  }
}
