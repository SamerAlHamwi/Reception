import 'package:flutter/foundation.dart';

import '../../../core/api/core_models/base_result_model.dart';
import '../../../core/api/core_models/empty_model.dart';
import '../../../core/api/data_source/remote_data_source.dart';
import '../../../core/api/http/api_urls.dart';
import '../../../core/api/http/http_method.dart';
import '../../select_unit_journy/data/my_ministriy_model.dart';
import '../data/calls_list_model.dart';
import '../data/notify_screen_model.dart';

class CallReceptionRepo {
  static Future<BaseResultModel> getDepartmentById(int id) async {
    return await RemoteDataSource.request<Departments>(
      converter: (json) => Departments.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      queryParameters: {"Id": id.toString()},
      url: ApiURLs.getDepartmentByIdURL,
    );
  }
  static Future<BaseResultModel> notifyScreenToJoin(NotifyScreenModel notifyScreenModel) async {
    return await RemoteDataSource.request<EmptyModel>(
      converter: (json) => EmptyModel.fromJson(json),
      data: notifyScreenModel.toJson(),
      method: HttpMethod.post,
      withAuthentication: true,
      url: ApiURLs.notifyScreenToJoinUrl,
    );
  }
  static Future<BaseResultModel> notifyScreenToLeave(NotifyScreenModel notifyScreenModel) async {
    return await RemoteDataSource.request<EmptyModel>(
      converter: (json) => EmptyModel.fromJson(json),
      data: notifyScreenModel.toJson(),
      method: HttpMethod.post,
      withAuthentication: true,
      url: ApiURLs.notifyScreenToLeaveUrl,
    );
  }

  static Future<BaseResultModel> joinCall(
      {required int id}) async {
    return await RemoteDataSource.request<EmptyModel>(
      converter: (json) => EmptyModel.fromJson(json),
      method: HttpMethod.post,
      withAuthentication: true,
      data: {"id": id},
      url: ApiURLs.joinCall,
    );
  }
  static Future<BaseResultModel> leaveCall(
      {required int id}) async {
    return await RemoteDataSource.request<EmptyModel>(
      converter: (json) => EmptyModel.fromJson(json),
      method: HttpMethod.post,
      withAuthentication: true,
      data: {"id": id},
      url: ApiURLs.leaveCall,
    );
  }

  static Future<BaseResultModel> cancelCallRequest(int callId) async {
    return await RemoteDataSource.request<EmptyModel>(
      converter: (json) => EmptyModel.fromJson(json),
      data: {"id":callId},
      method: HttpMethod.put,
      withAuthentication: true,
      url: ApiURLs.CancleCallRequestUrl,
    );
  }

  static Future<BaseResultModel> getCalls(data) async {
    var res = await RemoteDataSource.request<CallsModel>(
        converter: (json) => CallsModel.fromJson(json),
        method: HttpMethod.get,
        queryParameters: data.toJson(),
        withAuthentication: true,
        url: ApiURLs.getCalls);
    return res;
  }

  static Future<BaseResultModel> createCards(dynamic requestData) async {
    var res;
    try {
      res = await RemoteDataSource.request<EmptyModel>(
          converter: (json) => EmptyModel.fromJson(json),
          method: HttpMethod.post,
          withAuthentication: true,
          data: requestData.toJson(),
          url: ApiURLs.createCall);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return res;
  }
}
