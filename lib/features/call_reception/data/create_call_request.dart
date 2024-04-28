import 'dart:convert';


class CreateCallRequest {
  CreateCallRequest({
    this.leaderId,
    this.screenId,
    this.clientName,
    this.departmentId,
    this.asCrossMeeting
  });


  int? leaderId;
  int? screenId;
  int? departmentId;
  String? clientName;
  bool? asCrossMeeting;

  factory CreateCallRequest.fromRawJson(String str) =>
      CreateCallRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateCallRequest.fromJson(Map<String, dynamic> json) =>
      CreateCallRequest(
        leaderId: json["leaderId"],
        screenId: json["screenId"],
        clientName: json["callRequesterName"],
        departmentId: json["departmentId"],
        asCrossMeeting: json["asCrossMeeting"],
      );

  Map<String, dynamic> toJson() => {
    "leaderId": leaderId,
    "screenId": screenId,
    "callRequesterName": clientName,
    "departmentId": departmentId,
    "asCrossMeeting": asCrossMeeting,
  };
}
