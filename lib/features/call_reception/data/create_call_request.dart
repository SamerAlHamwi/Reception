import 'dart:convert';


class CreateCallRequest {
  CreateCallRequest({
    this.leaderId,
    this.screenId,
  });


  int? leaderId;
  int? screenId;

  factory CreateCallRequest.fromRawJson(String str) =>
      CreateCallRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateCallRequest.fromJson(Map<String, dynamic> json) =>
      CreateCallRequest(
        leaderId: json["leaderId"],
        screenId: json["screenId"],
      );

  Map<String, dynamic> toJson() => {
    "leaderId": leaderId,
    "screenId": screenId,
  };
}
