import '../../../core/api/core_models/base_result_model.dart';

class ClientsRequestsModel extends ListResultModel<OneClientRequest>{
  List<OneClientRequest>? list;
  int? totalCount;

  ClientsRequestsModel({this.list, this.totalCount});

  ClientsRequestsModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      list = [];
      json['items'].forEach((v) {
        list!.add(OneClientRequest.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['items'] = list!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    return data;
  }
}

class OneClientRequest {
  int? id;
  double? transactionNumber;
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
  String? clientFullName;
  String? creationTime;
  String? unitName;
  double? waitingSeconds;

  OneClientRequest(
      {this.id,
        this.transactionNumber,
        this.unitId,
        this.unit,
        this.disabilityCategory,
        this.clientFullName,
        this.clientRequestType,
        this.clientNationalNumberOrDisabilityNumber,
        this.disabilityNumber,
        this.employeetreatNumber,
        this.orderNumber,
        this.isLate,
        this.clientNationalNumber,
        this.treatTime,
        this.creationTime,
        this.unitName,
        this.waitingSeconds
      });

  OneClientRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionNumber = json['transactionNumber'];
    unitId = json['unitId'];
    disabilityCategory = json['disabilityCategory'] != null
        ? DisabilityCategory.fromJson(json['disabilityCategory'])
        : null;
    clientRequestType = json['clientRequestType'];
    clientNationalNumberOrDisabilityNumber =
    json['clientNationalNumberOrDisabilityNumber'];
    clientNationalNumber = json['clientNationalNumber'];
    disabilityNumber = json['disabilityNumber'];
    isLate = json['isLate'];
    clientFullName = json['clientFullName'];
    employeetreatNumber = json['employeetreatNumber'];
    treatTime = json['treatTime'];
    orderNumber = json['orderNumber'];
    creationTime = json['creationTime'];
    waitingSeconds = json['waitingSeconds'];
    unitName = json['unitName'] ?? '';
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transactionNumber'] = transactionNumber;
    data['unitId'] = unitId;
    if (disabilityCategory != null) {
      data['disabilityCategory'] = disabilityCategory!.toJson();
    }
    data['clientRequestType'] = clientRequestType;
    data['clientNationalNumberOrDisabilityNumber'] =
        clientNationalNumberOrDisabilityNumber;
    data['disabilityNumber'] = disabilityNumber;
    data['clientNationalNumber'] = clientNationalNumber;
    data['treatTime'] = treatTime;
    data['isLate'] = isLate;
    data['clientFullName'] = clientFullName;
    data['orderNumber'] = orderNumber;
    data['employeetreatNumber'] = employeetreatNumber;
    data['creationTime'] = creationTime;
    data['unitName'] = unitName;
    data['waitingSeconds'] = waitingSeconds;
    if (unit != null) {
      data['unit'] = unit!.toJson();
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
        translations!.add(Translations.fromJson(v));
      });
    }
    attachment = json['attachment'] != null
        ? Attachment.fromJson(json['attachment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['isActive'] = isActive;
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    if (attachment != null) {
      data['attachment'] = attachment!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['language'] = language;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
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
        ? Department.fromJson(json['department'])
        : null;
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    data['isActive'] = isActive;
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
        ? Ministry.fromJson(json['ministry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['isActive'] = isActive;
    if (ministry != null) {
      data['ministry'] = ministry!.toJson();
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
        ? Attachment.fromJson(json['attachment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['isActive'] = isActive;
    if (attachment != null) {
      data['attachment'] = attachment!.toJson();
    }
    return data;
  }
}
