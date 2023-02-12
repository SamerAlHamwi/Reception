class Attachments {
  String? url;
  int? id;

  Attachments({this.url, this.id});

  Attachments.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    return data;
  }
}