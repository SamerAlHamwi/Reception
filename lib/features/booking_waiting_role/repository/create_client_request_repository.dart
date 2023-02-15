
import 'package:ministries_reception_app/core/api/core_models/empty_model.dart';

import '../../../core/api/data_source/remote_data_source.dart';
import '../../../core/api/http/api_urls.dart';
import '../../../core/api/http/http_method.dart';
import '../data/create_client_request_model.dart';

class CreateClientRequestRepository {
  static Future<EmptyModel> createRquest(
      CreateClientRequestModel createClientRequestModel) async {
    return await RemoteDataSource.request<EmptyModel>(
      converter: (json) => EmptyModel.fromJson(json),
      method: HttpMethod.post,
      data: createClientRequestModel.toJson(),
      withAuthentication: false,
      url: ApiURLs.createClientRequestUrl,
    );
  }
}