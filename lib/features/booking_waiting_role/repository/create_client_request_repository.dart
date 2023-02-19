
import 'package:ministries_reception_app/core/api/core_models/empty_model.dart';

import '../../../core/api/data_source/remote_data_source.dart';
import '../../../core/api/http/api_urls.dart';
import '../../../core/api/http/http_method.dart';
import '../data/create_client_request_model.dart';
import '../data/create_client_response_model.dart';

class CreateClientRequestRepository {
  static Future<CreateClientResponseModel> createRequest(
      CreateClientRequestModel createClientRequestModel) async {
    return await RemoteDataSource.request<CreateClientResponseModel>(
      converter: (json) => CreateClientResponseModel.fromJson(json),
      method: HttpMethod.post,
      data: createClientRequestModel.toJson(),
      withAuthentication: true,
      url: ApiURLs.createClientRequestUrl,
    );
  }
}