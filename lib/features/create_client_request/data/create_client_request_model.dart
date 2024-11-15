class CreateClientRequestModel {
  int? disabilityCategoryId;
  int? unitId;
  double? transactionNumber;
  String? clientNationalNumber;
  String? clientFullName;
  String? disabilityNumber;
  String? treatTime;
  int? id;
  String? employeetreatNumber;

  CreateClientRequestModel(
      {this.disabilityCategoryId,
      this.unitId,
      this.transactionNumber,
      this.clientNationalNumber,
      this.clientFullName,
      this.disabilityNumber,
      this.treatTime,
      this.id,
      this.employeetreatNumber});

  CreateClientRequestModel.fromJson(Map<String, dynamic> json) {
    disabilityCategoryId = json['disabilityCategoryId'];
    unitId = json['unitId'];
    transactionNumber = json['transactionNumber'];
    clientNationalNumber = json['clientNationalNumber'];
    disabilityNumber = json['disabilityNumber'];
    treatTime = json['treatTime'];
    clientFullName = json['clientFullName'];
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
    data['clientFullName'] = this.clientFullName;
    data['id'] = this.id;
    data['transactionNumber'] = this.transactionNumber;
    data['employeetreatNumber'] = this.employeetreatNumber;
    return data;
  }
}
