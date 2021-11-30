// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    required this.success,
    required this.data,
    required this.msg,
  });

  bool success;
  Data data;
  String msg;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
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
    required this.name,
    required this.email,
    required this.phone,
    required this.district,
    required this.area,
    required this.image,
    required this.type,
    required this.rank,
    required this.totalEarn,
    required this.withdrawAmount,
    required this.dailyCommission,
    required this.investAmount,
    required this.dailyAddLimit,
  });

  String name;
  String email;
  String phone;
  String district;
  dynamic area;
  String image;
  String type;
  String rank;
  String totalEarn;
  String withdrawAmount;
  String dailyCommission;
  String investAmount;
  String dailyAddLimit;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    district: json["district"],
    area: json["area"],
    image: json["image"],
    type: json["type"],
    rank: json["rank"].toString(),
    totalEarn: json["total_earn"].toString(),
    withdrawAmount: json["withdraw_amount"].toString(),
    dailyCommission: json["daily_commission"].toString(),
    investAmount: json["invest_amount"].toString(),
    dailyAddLimit: json["daily_add_limit"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "district": district,
    "area": area,
    "image": image,
    "type": type,
    "rank": rank,
    "total_earn": totalEarn,
    "withdraw_amount": withdrawAmount,
    "daily_commission": dailyCommission,
    "invest_amount": investAmount,
    "daily_add_limit": dailyAddLimit,
  };
}
