

import '../../../core/api/core_models/base_result_model.dart';

class CreateClientResponseModel extends BaseResultModel {

  String? clientNationalNumberOrDisabilityNumber;
  String? treatTime;
  int? clientRequestType;
  int? id;
  dynamic employeetreatNumber;


  CreateClientResponseModel(
      {this.clientRequestType,
        this.clientNationalNumberOrDisabilityNumber,
        this.employeetreatNumber,
        this.treatTime,
        this.id});

  CreateClientResponseModel.fromJson(Map<String, dynamic> json) {
    clientRequestType = json['clientRequestType'];
    clientNationalNumberOrDisabilityNumber =
    json['clientNationalNumberOrDisabilityNumber'];
    employeetreatNumber = json['employeetreatNumber'];
    treatTime = json['treatTime'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientRequestType'] = this.clientRequestType;
    data['clientNationalNumberOrDisabilityNumber'] =
        this.clientNationalNumberOrDisabilityNumber;
    data['employeetreatNumber'] = this.employeetreatNumber;
    data['treatTime'] = this.treatTime;
    data['id'] = this.id;
    return data;
  }
}