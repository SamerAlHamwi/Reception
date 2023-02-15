
class CreateClientRequestModel {
  int? disabilityCategoryId;
  int? unitId;
  String? clientNationalNumberOrDisabilityNumber;
  String? treatTime;

  CreateClientRequestModel(
      {this.disabilityCategoryId,
        this.unitId,
        this.clientNationalNumberOrDisabilityNumber,
        this.treatTime});

  CreateClientRequestModel.fromJson(Map<String, dynamic> json) {
    disabilityCategoryId = json['disabilityCategoryId'];
    unitId = json['unitId'];
    clientNationalNumberOrDisabilityNumber =
    json['clientNationalNumberOrDisabilityNumber'];
    treatTime = json['treatTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disabilityCategoryId'] = this.disabilityCategoryId;
    data['unitId'] = this.unitId;
    data['clientNationalNumberOrDisabilityNumber'] =
        this.clientNationalNumberOrDisabilityNumber;
    data['treatTime'] = this.treatTime;
    return data;
  }
}