class CreateClientRequestModel {
  int? disabilityCategoryId;
  int? unitId;
  String? clientNationalNumber;
  String? disabilityNumber;
  String? treatTime;
  int? id;
  String? employeetreatNumber;

  CreateClientRequestModel(
      {this.disabilityCategoryId,
      this.unitId,
      this.clientNationalNumber,
      this.disabilityNumber,
      this.treatTime,
      this.id,
      this.employeetreatNumber});

  CreateClientRequestModel.fromJson(Map<String, dynamic> json) {
    disabilityCategoryId = json['disabilityCategoryId'];
    unitId = json['unitId'];
    clientNationalNumber = json['clientNationalNumber'];
    disabilityNumber = json['disabilityNumber'];
    treatTime = json['treatTime'];
    id = json['id'];
    employeetreatNumber = json['employeetreatNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disabilityCategoryId'] = this.disabilityCategoryId;
    data['unitId'] = this.unitId;
    data['disabilityNumber'] = this.disabilityNumber;
    data['clientNationalNumber'] = this.clientNationalNumber;
    data['treatTime'] = this.treatTime;
    data['id'] = this.id;
    data['employeetreatNumber'] = this.employeetreatNumber;
    return data;
  }
}
