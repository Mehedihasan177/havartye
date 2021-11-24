// To parse this JSON data, do
//
//     final withdrawResponse = withdrawResponseFromJson(jsonString);

import 'dart:convert';

WithdrawResponse withdrawResponseFromJson(String str) => WithdrawResponse.fromJson(json.decode(str));

String withdrawResponseToJson(WithdrawResponse data) => json.encode(data.toJson());

class WithdrawResponse {
  WithdrawResponse({
    required this.success,
    required this.msg,
  });

  bool success;
  String msg;

  factory WithdrawResponse.fromJson(Map<String, dynamic> json) => WithdrawResponse(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}
