

import '../../../core/api/core_models/base_result_model.dart';
import 'call_model.dart';

class CallsModel  extends ListResultModel<Call> {
  int? totalCount;
  List<Call>? list;

  CallsModel({this.totalCount, this.list});

  CallsModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      list =[];
      json['items'].forEach((v) {
        list!.add(Call.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['totalCount'] = totalCount;
    if (list!= null) {
      data['items'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
