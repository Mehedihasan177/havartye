// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    required this.data,
    required this.accessToken,
    required this.tokenType,
    required this.success,
  });

  Data data;
  String accessToken;
  String tokenType;
  bool success;

  factory SignInResponse.fromJson(Map<dynamic, dynamic> json) => SignInResponse(
    data: Data.fromJson(json["data"]),
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "access_token": accessToken,
    "token_type": tokenType,
    "success": success,
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.packageValidity,
    required this.packageName,
    required this.district,
    required this.area,
    required this.image,
    required this.type,
    required this.rank,
    required this.cash,
    required this.outsourcing,
    required this.shopping,
    required this.totalEarn,
    required this.withdrawAmount,
    required this.dailyCommotion,
    required this.dailyAddLimit,
    required this.leftUsers,
    required this.rightUsers,
    required this.leftCarry,
    required this.rightCarry,
    required this.password,
  });

  int id;
  String name;
  String email;
  String phone;
  dynamic packageValidity;
  String packageName;
  String district;
  dynamic area;
  String image;
  String type;
  String rank;
  double cash;
  double outsourcing;
  double shopping;
  double totalEarn;
  double withdrawAmount;
  double dailyCommotion;
  int dailyAddLimit;
  int leftUsers;
  int rightUsers;
  int leftCarry;
  int rightCarry;
  String password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    packageValidity: json["package_validity"],
    packageName: json["package_name"],
    district: json["district"],
    area: json["area"],
    image: json["image"],
    type: json["type"],
    rank: json["rank"].toString(),
    cash: json["cash"].toDouble(),
    outsourcing: json["outsourcing"].toDouble(),
    shopping: json["shopping"].toDouble(),
    totalEarn: json["total_earn"].toDouble(),
    withdrawAmount: json["withdraw_amount"].toDouble(),
    dailyCommotion: json["daily_commotion"].toDouble(),
    dailyAddLimit: json["daily_add_limit"],
    leftUsers: json["left_users"],
    rightUsers: json["right_users"],
    leftCarry: json["left_carry"],
    rightCarry: json["right_carry"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "package_validity": "${packageValidity.year.toString().padLeft(4, '0')}-${packageValidity.month.toString().padLeft(2, '0')}-${packageValidity.day.toString().padLeft(2, '0')}",
    "package_name": packageName,
    "district": district,
    "area": area,
    "image": image,
    "type": type,
    "rank": rank,
    "cash": cash,
    "outsourcing": outsourcing,
    "shopping": shopping,
    "total_earn": totalEarn,
    "withdraw_amount": withdrawAmount,
    "daily_commotion": dailyCommotion,
    "daily_add_limit": dailyAddLimit,
    "left_users": leftUsers,
    "right_users": rightUsers,
    "left_carry": leftCarry,
    "right_carry": rightCarry,
    "password": password,
  };
}
