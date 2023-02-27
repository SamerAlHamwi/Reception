

import '../../../core/api/core_models/base_result_model.dart';

class MyMinistryModel extends BaseResultModel {
  int? id;
  int? ministryRequestType;
  String? name;
  String? description;
  List<Departments>? departments;
  List<Receptions>? receptions;
  List<Screen>? screens;
  List<Translations>? translations;
  Attachment? attachment;

  MyMinistryModel(
      {this.id,
        this.ministryRequestType,
        this.name,
        this.description,
        this.screens,
        this.departments,
        this.receptions,
        this.translations,
        this.attachment});

  MyMinistryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ministryRequestType = json['ministryRequestType'];
    name = json['name'];
    description = json['description'];
    if (json['departments'] != null) {
      departments = [];
      json['departments'].forEach((v) {
        departments!.add(new Departments.fromJson(v));
      });
    }

    // if (json['receptions'] != null) {
    //
    //   receptions = [];
    //   json['receptions'].forEach((v) {
    //     receptions!.add(new Receptions.fromJson(v));
    //   });
    // }

    if (json['translations'] != null) {
      translations =[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
    if (json['screens'] != null) {
      screens =[];
      json['screens'].forEach((v) {
        screens!.add(new Screen.fromJson(v));
      });
    }

    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ministryRequestType'] = this.ministryRequestType;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.departments != null) {
      data['departments'] = this.departments!.map((v) => v.toJson()).toList();
    }
    if (this.receptions != null) {
      data['receptions'] = this.receptions!.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    if (this.attachment != null) {
      data['attachment'] = this.attachment!.toJson();
    }
    return data;
  }
}

class Departments extends BaseResultModel{
  int? id;
  String? name;
  String? description;
  bool? isActive;
  List<Units>? units;
  List<Employees>? employees;
  List<Translations>? translations;

  Departments(
      {this.id,
        this.name,
        this.description,
        this.isActive,
        this.units,
        this.employees,
        this.translations});

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['isActive'];
    if (json['units'] != null) {
      units = [];
      json['units'].forEach((v) {
        units!.add(new Units.fromJson(v));
      });
    }
    if (json['employees'] != null) {
      employees = [];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = [];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    if (this.units != null) {
      data['units'] = this.units!.map((v) => v.toJson()).toList();
    }
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Units {
  int? id;
  String? name;
  String? description;
  bool? isActive;

  Units({this.id, this.name, this.description, this.isActive});

  Units.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isActive'] = this.isActive;
    return data;
  }
}

class Employees {
  int? id;
  String? userName;
  String? name;
  String? surname;
  String? userPosition;
  String? emailAddress;
  bool? isActive;
  String? fullName;
  String? lastLoginTime;
  String? creationTime;
  int? userType;
  int? unitId;
  int? departmentId;
  int? ministryId;
  Attachment? attachment;

  Employees(
      {this.id,
        this.userName,
        this.name,
        this.surname,
        this.emailAddress,
        this.userPosition,
        this.attachment,
        this.isActive,
        this.fullName,
        this.lastLoginTime,
        this.creationTime,
        this.userType,
        this.unitId,
        this.departmentId,
        this.ministryId,
      });

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    name = json['name'];
    surname = json['surname'];
    emailAddress = json['emailAddress'];
    userPosition = json['userPosition'] ?? '';
    isActive = json['isActive'];
    fullName = json['fullName'];
    lastLoginTime = json['lastLoginTime'];
    creationTime = json['creationTime'];
    userType = json['userType'];
    unitId = json['unitId'];
    departmentId = json['departmentId'];
    ministryId = json['ministryId'];
    if (json['attachment'] != null) {
      attachment = Attachment.fromJson(json["attachment"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['emailAddress'] = this.emailAddress;
    data['userPosition'] = userPosition;
    data['isActive'] = this.isActive;
    data['fullName'] = this.fullName;
    data['lastLoginTime'] = this.lastLoginTime;
    data['creationTime'] = this.creationTime;
    data['userType'] = this.userType;
    data['unitId'] = this.unitId;
    data['departmentId'] = this.departmentId;
    data['ministryId'] = this.ministryId;
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
class Receptions {
  int? id;
  String? userName;
  String? name;
  String? surname;
  String? emailAddress;
  bool? isActive;
  String? fullName;
  String? lastLoginTime;
  String? creationTime;
  int? userType;
  int? unitId;
  int? departmentId;
  int? ministryId;
  List<String>? roleNames;

  Receptions(
      {this.id,
        this.userName,
        this.name,
        this.surname,
        this.emailAddress,
        this.isActive,
        this.fullName,
        this.lastLoginTime,
        this.creationTime,
        this.userType,
        this.unitId,
        this.departmentId,
        this.ministryId,
        this.roleNames});

  Receptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    name = json['name'];
    surname = json['surname'];
    emailAddress = json['emailAddress'];
    isActive = json['isActive'];
    fullName = json['fullName'];
    lastLoginTime = json['lastLoginTime'];
    creationTime = json['creationTime'];
    userType = json['userType'];
    unitId = json['unitId'];
    departmentId = json['departmentId'];
    ministryId = json['ministryId'];
    roleNames = json['roleNames'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['emailAddress'] = this.emailAddress;
    data['isActive'] = this.isActive;
    data['fullName'] = this.fullName;
    data['lastLoginTime'] = this.lastLoginTime;
    data['creationTime'] = this.creationTime;
    data['userType'] = this.userType;
    data['unitId'] = this.unitId;
    data['departmentId'] = this.departmentId;
    data['ministryId'] = this.ministryId;
    data['roleNames'] = this.roleNames;
    return data;
  }
}
class Screen {
  int? id;
  String? userName;
  String? name;
  String? userPosition;
  String? surname;
  String? emailAddress;
  bool? isActive;
  String? fullName;
  String? lastLoginTime;
  String? creationTime;
  int? userType;
  int? unitId;
  int? departmentId;
  int? ministryId;
  List<String>? roleNames;

  Screen(
      {this.id,
        this.userName,
        this.name,
        this.userPosition,
        this.surname,
        this.emailAddress,
        this.isActive,
        this.fullName,
        this.lastLoginTime,
        this.creationTime,
        this.userType,
        this.unitId,
        this.departmentId,
        this.ministryId,
        this.roleNames});

  Screen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    name = json['name'];
    userPosition = json['userPosition'];
    surname = json['surname'];
    emailAddress = json['emailAddress'];
    isActive = json['isActive'];
    fullName = json['fullName'];
    lastLoginTime = json['lastLoginTime'];
    creationTime = json['creationTime'];
    userType = json['userType'];
    unitId = json['unitId'];
    departmentId = json['departmentId'];
    ministryId = json['ministryId'];
    if(json['roleNames']!=null){
    json['roleNames'].forEach((v) {
      roleNames!.add(v);
    });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['userPosition'] = this.userPosition;
    data['surname'] = this.surname;
    data['emailAddress'] = this.emailAddress;
    data['isActive'] = this.isActive;
    data['fullName'] = this.fullName;
    data['lastLoginTime'] = this.lastLoginTime;
    data['creationTime'] = this.creationTime;
    data['userType'] = this.userType;
    data['unitId'] = this.unitId;
    data['departmentId'] = this.departmentId;
    data['ministryId'] = this.ministryId;
    data['roleNames'] = this.roleNames;
    return data;
  }
}