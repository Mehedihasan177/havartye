// To parse this JSON data, do
//
//     final balanceTraNsferResponse = balanceTraNsferResponseFromJson(jsonString);

import 'dart:convert';

BalanceTraNsferResponse balanceTraNsferResponseFromJson(String str) => BalanceTraNsferResponse.fromJson(json.decode(str));

String balanceTraNsferResponseToJson(BalanceTraNsferResponse data) => json.encode(data.toJson());

class BalanceTraNsferResponse {
  BalanceTraNsferResponse({
    required this.success,
    required this.msg,
    required this.amount,
  });

  bool success;
  String msg;
  String amount;

  factory BalanceTraNsferResponse.fromJson(Map<String, dynamic> json) => BalanceTraNsferResponse(
    success: json["success"],
    msg: json["msg"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
    "amount": amount,
  };
}
