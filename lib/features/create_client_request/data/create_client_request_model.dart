
class CreateClientRequestModel {
  int? disabilityCategoryId;
  int? unitId;
  String? clientNationalNumberOrDisabilityNumber;
  String? treatTime;
  int? id;
  String? employeetreatNumber;

  CreateClientRequestModel(
      {this.disabilityCategoryId,
        this.unitId,
        this.clientNationalNumberOrDisabilityNumber,
        this.treatTime,
        this.id,
        this.employeetreatNumber});

  CreateClientRequestModel.fromJson(Map<String, dynamic> json) {
    disabilityCategoryId = json['disabilityCategoryId'];
    unitId = json['unitId'];
    clientNationalNumberOrDisabilityNumber =
    json['clientNationalNumberOrDisabilityNumber'];
    treatTime = json['treatTime'];
    id = json['id'];
    employeetreatNumber = json['employeetreatNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disabilityCategoryId'] = this.disabilityCategoryId;
    data['unitId'] = this.unitId;
    data['clientNationalNumberOrDisabilityNumber'] =
        this.clientNationalNumberOrDisabilityNumber;
    data['treatTime'] = this.treatTime;
    data['id'] = this.id;
    data['employeetreatNumber'] = this.employeetreatNumber;
    return data;
  }
}