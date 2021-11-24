// To parse this JSON data, do
//
//     final positionTrackingResponse = positionTrackingResponseFromJson(jsonString);

import 'dart:convert';

PositionTrackingResponse positionTrackingResponseFromJson(String str) => PositionTrackingResponse.fromJson(json.decode(str));

String positionTrackingResponseToJson(PositionTrackingResponse data) => json.encode(data.toJson());

class PositionTrackingResponse {
  PositionTrackingResponse({
    required this.success,
    required this.data,
    required this.msg,
  });

  bool success;
  Data data;
  String msg;

  factory PositionTrackingResponse.fromJson(Map<String, dynamic> json) => PositionTrackingResponse(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "msg": msg,
  };
}

class Data {
  Data({
    required this.posId,
    required this.name,
    required this.userName,
    required this.position,
  });

  int posId;
  String name;
  String userName;
  String position;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    posId: json["pos_id"],
    name: json["name"].toString(),
    userName: json["userName"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "pos_id": posId,
    "name": name,
    "userName": userName,
    "position": position,
  };
}
