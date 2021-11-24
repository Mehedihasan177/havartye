// To parse this JSON data, do
//
//     final allPackagesResponse = allPackagesResponseFromJson(jsonString);

import 'dart:convert';

AllPackagesResponse allPackagesResponseFromJson(String str) => AllPackagesResponse.fromJson(json.decode(str));

String allPackagesResponseToJson(AllPackagesResponse data) => json.encode(data.toJson());

class AllPackagesResponse {
  AllPackagesResponse({
    required this.success,
    required this.data,
    required this.msg,
  });

  bool success;
  List<Datum> data;
  String msg;

  factory AllPackagesResponse.fromJson(Map<String, dynamic> json) => AllPackagesResponse(
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
    required this.adLimit,
    required this.type,
    required this.duration,
    required this.amount,
    required this.dailyBonus,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int adLimit;
  String type;
  String duration;
  int amount;
  int dailyBonus;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    adLimit: json["ad_limit"],
    type: json["type"],
    duration: json["duration"],
    amount: json["amount"],
    dailyBonus: json["daily_bonus"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "ad_limit": adLimit,
    "type": type,
    "duration": duration,
    "amount": amount,
    "daily_bonus": dailyBonus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
