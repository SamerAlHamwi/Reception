
import '../../../core/api/core_models/base_result_model.dart';
import '../../../core/api/data_source/remote_data_source.dart';
import '../../../core/api/http/api_urls.dart';
import '../../../core/api/http/http_method.dart';
import '../../auth/data/login_request_model.dart';
import '../data/clients_requests_model.dart';
import '../data/my_ministriy_model.dart';

class UnitScreenRepository
{
  static Future<BaseResultModel> getClientsList() async {
    return await RemoteDataSource.request<ClientsRequestsModel>(
      converter: (json) => ClientsRequestsModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: ApiURLs.getClientsRequestsURL,
    );
  }
  static Future<BaseResultModel> getMyMinistries() async {
    return await RemoteDataSource.request<MyMinistriyModel>(
      converter: (json) => MyMinistriyModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: ApiURLs.getMyMinistriesURL,
    );
  }
}