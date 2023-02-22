

import '../../../core/api/core_models/base_result_model.dart';

class CreateClientResponseModel extends BaseResultModel {

  String? disabilityNumber;
  String? clientNationalNumber;
  String? treatTime;
  int? clientRequestType;
  int? id;
  dynamic employeetreatNumber;


  CreateClientResponseModel(
      {this.clientRequestType,
        this.disabilityNumber,
        this.clientNationalNumber,
        this.employeetreatNumber,
        this.treatTime,
        this.id});

  CreateClientResponseModel.fromJson(Map<String, dynamic> json) {
    clientRequestType = json['clientRequestType'];
    clientNationalNumber = json['clientNationalNumber'];
    disabilityNumber = json['disabilityNumber'];
    employeetreatNumber = json['employeetreatNumber'];
    treatTime = json['treatTime'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientRequestType'] = this.clientRequestType;
    data['disabilityNumber'] =
        this.disabilityNumber;
    data['clientNationalNumber'] =
        this.clientNationalNumber;
    data['employeetreatNumber'] = this.employeetreatNumber;
    data['treatTime'] = this.treatTime;
    data['id'] = this.id;
    return data;
  }
}