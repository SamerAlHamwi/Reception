import '../../../core/api/core_models/base_result_model.dart';
import '../../../core/api/data_source/remote_data_source.dart';
import '../../../core/api/http/api_urls.dart';
import '../../../core/api/http/http_method.dart';
import '../data/one_request_model.dart';

class ProcessingRequestRepository {

  static Future<BaseResultModel> getOneRequestDetails(int id) async {
    return await RemoteDataSource.request<OneClientRequestModel>(
      converter: (json) => OneClientRequestModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      queryParameters: {"Id":id.toString()},
      url: ApiURLs.getRequestById,
    );
  }
}
