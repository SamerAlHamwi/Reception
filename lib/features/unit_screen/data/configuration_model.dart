

import '../../../core/api/core_models/base_result_model.dart';

class ConfigurationModel extends BaseResultModel {
  int? fileSize;
  String? jitsiServer;
  int? slaCompare;

  ConfigurationModel({this.fileSize, this.jitsiServer, this.slaCompare});

  ConfigurationModel.fromJson(Map<String, dynamic> json) {
    fileSize = json['fileSize'];
    jitsiServer = json['jitsiServer'];
    slaCompare = json['slaCompare'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileSize'] = this.fileSize;
    data['jitsiServer'] = this.jitsiServer;
    data['slaCompare'] = this.slaCompare;
    return data;
  }
}