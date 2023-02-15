

import '../../../core/api/core_models/base_result_model.dart';
import '../../../core/api/data_source/remote_data_source.dart';
import '../../../core/api/http/api_urls.dart';
import '../../../core/api/http/http_method.dart';
import '../data/disability_category_model.dart';
import '../data/my_ministriy_model.dart';

class MinistrieyRepo
{
  static Future<BaseResultModel> getMyMinistries() async {
    return await RemoteDataSource.request<MyMinistriyModel>(
      converter: (json) => MyMinistriyModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: ApiURLs.getMyMinistriesURL,
    );
  } static Future<BaseResultModel> getMinistriesById(int id) async {
    return await RemoteDataSource.request<MyMinistriyModel>(
      converter: (json) => MyMinistriyModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      queryParameters: {"Id":id.toString()},
      url: ApiURLs.getMinistriesByIdURL,
    );
  } static Future<BaseResultModel> getDisabilityCatergory() async {
    return await RemoteDataSource.request<DisabilityCategoryModel>(
      converter: (json) => DisabilityCategoryModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: ApiURLs.getDisabilityCategoryURL,
    );
  }

}