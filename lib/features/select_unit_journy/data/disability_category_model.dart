

import '../../../core/api/core_models/base_result_model.dart';
import 'my_ministriy_model.dart';

class DisabilityCategoryModel extends BaseResultModel {
  int? totalCount;
  List<Disability>? disabilityList;

  DisabilityCategoryModel({this.totalCount, this.disabilityList});

  DisabilityCategoryModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      disabilityList =[];
      json['items'].forEach((v) {
        disabilityList!.add(new Disability.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.disabilityList!= null) {
      data['items'] = this.disabilityList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Disability {
  String? name;
  bool? isActive;
  Attachment? attachment;
  int? id;

  Disability({this.name, this.isActive, this.attachment, this.id});

  Disability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isActive = json['isActive'];
    id = json['id'];
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isActive'] = this.isActive;
    if (this.attachment != null) {
      data['attachment'] = this.attachment!.toJson();
    }    data['id'] = this.id;
    return data;
  }


}