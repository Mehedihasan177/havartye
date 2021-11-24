// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    required this.success,
    required this.profileResponses,
    required this.msg,
  });

  bool success;
  ProfileResponses profileResponses;
  String msg;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    success: json["success"],
    profileResponses: ProfileResponses.fromJson(json["ProfileResponses"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "ProfileResponses": profileResponses.toJson(),
    "msg": msg,
  };
}

class ProfileResponses {
  ProfileResponses({
    required this.name,
    required this.email,
    required this.phone,
    required this.district,
    this.area,
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
  int totalEarn;
  int withdrawAmount;
  int dailyCommission;
  int investAmount;
  int dailyAddLimit;

  factory ProfileResponses.fromJson(Map<String, dynamic> json) => ProfileResponses(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    district: json["district"],
    area: json["area"],
    image: json["image"],
    type: json["type"],
    rank: json["rank"],
    totalEarn: json["total_earn"],
    withdrawAmount: json["withdraw_amount"],
    dailyCommission: json["daily_commission"],
    investAmount: json["invest_amount"],
    dailyAddLimit: json["daily_add_limit"],
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
