// To parse this JSON data, do
//
//     final divisionResponse = divisionResponseFromJson(jsonString);

import 'dart:convert';

DivisionResponse divisionResponseFromJson(String str) => DivisionResponse.fromJson(json.decode(str));

String divisionResponseToJson(DivisionResponse data) => json.encode(data.toJson());

class DivisionResponse {
  DivisionResponse({
    required this.success,
    required this.data,
    required this.msg,
  });

  bool success;
  List<Datum> data;
  String msg;

  factory DivisionResponse.fromJson(Map<String, dynamic> json) => DivisionResponse(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "msg": msg,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
