
class NotifyScreenModel {
  int? id;
  int? screenId;

  NotifyScreenModel({this.id, this.screenId});

  NotifyScreenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    screenId = json['screenId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['screenId'] = this.screenId;
    return data;
  }
}