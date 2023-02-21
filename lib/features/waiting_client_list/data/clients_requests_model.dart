import '../../../core/api/core_models/base_result_model.dart';

class ClientsRequestsModel extends BaseResultModel{
  List<OneClientRequest>? listClientsRequests;
  int? totalCount;

  ClientsRequestsModel({this.listClientsRequests, this.totalCount});

  ClientsRequestsModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      listClientsRequests = [];
      json['items'].forEach((v) {
        listClientsRequests!.add(new OneClientRequest.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listClientsRequests != null) {
      data['items'] = this.listClientsRequests!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class OneClientRequest {
  int? id;
  int? unitId;
  DisabilityCategory? disabilityCategory;
  int? clientRequestType;
  String? clientNationalNumberOrDisabilityNumber;
  String? employeetreatNumber;
  String? treatTime;
  String? creationTime;
  int? waitingSeconds;

  OneClientRequest(
      {this.id,
        this.unitId,
        this.disabilityCategory,
        this.clientRequestType,
        this.clientNationalNumberOrDisabilityNumber,
        this.employeetreatNumber,
        this.treatTime,
        this.creationTime,
        this.waitingSeconds
      });

  OneClientRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitId = json['unitId'];
    disabilityCategory = json['disabilityCategory'] != null
        ? new DisabilityCategory.fromJson(json['disabilityCategory'])
        : null;
    clientRequestType = json['clientRequestType'];
    clientNationalNumberOrDisabilityNumber =
    json['clientNationalNumberOrDisabilityNumber'];
    employeetreatNumber = json['employeetreatNumber'];
    treatTime = json['treatTime'];
    creationTime = json['creationTime'];
    waitingSeconds = json['waitingSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['unitId'] = this.unitId;
    if (this.disabilityCategory != null) {
      data['disabilityCategory'] = this.disabilityCategory!.toJson();
    }
    data['clientRequestType'] = this.clientRequestType;
    data['clientNationalNumberOrDisabilityNumber'] =
        this.clientNationalNumberOrDisabilityNumber;
    data['employeetreatNumber'] = this.employeetreatNumber;
    data['treatTime'] = this.treatTime;
    data['creationTime'] = this.creationTime;
    data['waitingSeconds'] = this.waitingSeconds;
    return data;
  }
}

class DisabilityCategory {
  int? id;
  String? name;
  bool? isActive;
  List<Translations>? translations;
  Attachment? attachment;

  DisabilityCategory(
      {this.id, this.name, this.isActive, this.translations, this.attachment});

  DisabilityCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['isActive'];
    if (json['translations'] != null) {
      translations =[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isActive'] = this.isActive;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    if (this.attachment != null) {
      data['attachment'] = this.attachment!.toJson();
    }
    return data;
  }
}

class Translations {
  String? name;
  String? language;

  Translations({this.name, this.language});

  Translations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['language'] = this.language;
    return data;
  }
}

class Attachment {
  int? id;
  String? url;

  Attachment({this.id, this.url});

  Attachment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}