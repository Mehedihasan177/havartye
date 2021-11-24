// To parse this JSON data, do
//
//     final currentPackagesResponse = currentPackagesResponseFromJson(jsonString);

import 'dart:convert';

CurrentPackagesResponse currentPackagesResponseFromJson(String str) => CurrentPackagesResponse.fromJson(json.decode(str));

String currentPackagesResponseToJson(CurrentPackagesResponse data) => json.encode(data.toJson());

class CurrentPackagesResponse {
  CurrentPackagesResponse({
    required this.success,
    required this.data,
    required this.msg,
  });

  bool success;
  Data data;
  String msg;

  factory CurrentPackagesResponse.fromJson(Map<String, dynamic> json) => CurrentPackagesResponse(
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
    required this.id,
    required this.name,
    required this.adLimit,
    required this.type,
    required this.amount,
    required this.dailyBonus,
    required this.holiday,
    required this.expiryDate,
  });

  String id;
  String name;
  String adLimit;
  String type;
  String amount;
  String dailyBonus;
  String holiday;
  String expiryDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"].toString(),
    name: json["name"].toString(),
    adLimit: json["ad_limit"].toString(),
    type: json["type"].toString(),
    amount: json["amount"].toString(),
    dailyBonus: json["daily_bonus"].toString(),
    holiday: json["holiday"].toString(),
    expiryDate: json["expiry_date"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "ad_limit": adLimit,
    "type": type,
    "amount": amount,
    "daily_bonus": dailyBonus,
    "holiday": holiday,
    "expiry_date": expiryDate,
  };
}
