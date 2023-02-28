
import '../../../core/api/core_models/base_result_model.dart';

class OneClientRequestModel extends BaseResultModel{
  int? id;
  int? clientRequestType;
  String? clientNationalNumber;
  String? disabilityNumber;
  String? employeetreatNumber;
  String? treatTime;
  String? orderNumber;

  OneClientRequestModel(
      {this.id,
        this.clientRequestType,
        this.clientNationalNumber,
        this.disabilityNumber,
        this.employeetreatNumber,
        this.treatTime,
        this.orderNumber});

  OneClientRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientRequestType = json['clientRequestType'];
    clientNationalNumber = json['clientNationalNumber'];
    disabilityNumber = json['disabilityNumber'];
    employeetreatNumber = json['employeetreatNumber'];
    treatTime = json['treatTime'];
    orderNumber = json['orderNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clientRequestType'] = this.clientRequestType;
    data['clientNationalNumber'] = this.clientNationalNumber;
    data['disabilityNumber'] = this.disabilityNumber;
    data['employeetreatNumber'] = this.employeetreatNumber;
    data['treatTime'] = this.treatTime;
    data['orderNumber'] = this.orderNumber;
    return data;
  }
}