import '../../../core/api/core_models/base_result_model.dart';

class ClientsRequestsModel extends ListResultModel<OneClientRequest>{
  List<OneClientRequest>? list;
  int? totalCount;

  ClientsRequestsModel({this.list, this.totalCount});

  ClientsRequestsModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      list = [];
      json['items'].forEach((v) {
        list!.add(new OneClientRequest.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['items'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class OneClientRequest {
  int? id;
  int? unitId;
  Unit? unit;
  DisabilityCategory? disabilityCategory;
  int? clientRequestType;
  String? clientNationalNumberOrDisabilityNumber;
  String? disabilityNumber;
  String? clientNationalNumber;
  String? employeetreatNumber;
  String? orderNumber;
  bool? isLate;
  String? treatTime;
  String? creationTime;
  double? waitingSeconds;

  OneClientRequest(
      {this.id,
        this.unitId,
        this.unit,
        this.disabilityCategory,
        this.clientRequestType,
        this.clientNationalNumberOrDisabilityNumber,
        this.disabilityNumber,
        this.employeetreatNumber,
        this.orderNumber,
        this.isLate,
        this.clientNationalNumber,
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
    clientNationalNumber = json['clientNationalNumber'];
    disabilityNumber = json['disabilityNumber'];
    isLate = json['isLate'];
    employeetreatNumber = json['employeetreatNumber'];
    treatTime = json['treatTime'];
    orderNumber = json['orderNumber'];
    creationTime = json['creationTime'];
    waitingSeconds = json['waitingSeconds'];
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;

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
    data['disabilityNumber'] = this.disabilityNumber;
    data['clientNationalNumber'] = this.clientNationalNumber;
    data['treatTime'] = this.treatTime;
    data['isLate'] = this.isLate;
    data['orderNumber'] = this.orderNumber;
    data['employeetreatNumber'] = this.employeetreatNumber;
    data['creationTime'] = this.creationTime;
    data['waitingSeconds'] = this.waitingSeconds;
    if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
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
class Unit {
  int? id;
  String? name;
  String? description;
  Department? department;
  bool? isActive;

  Unit({this.id, this.name, this.description, this.department, this.isActive});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    data['isActive'] = this.isActive;
    return data;
  }
}

class Department {
  int? id;
  String? name;
  String? description;
  bool? isActive;
  Ministry? ministry;

  Department(
      {this.id, this.name, this.description, this.isActive, this.ministry});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['isActive'];
    ministry = json['ministry'] != null
        ? new Ministry.fromJson(json['ministry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    if (this.ministry != null) {
      data['ministry'] = this.ministry!.toJson();
    }
    return data;
  }
}

class Ministry {
  int? id;
  String? name;
  String? description;
  bool? isActive;
  Attachment? attachment;

  Ministry(
      {this.id, this.name, this.description, this.isActive, this.attachment});

  Ministry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['isActive'];
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    if (this.attachment != null) {
      data['attachment'] = this.attachment!.toJson();
    }
    return data;
  }
}
