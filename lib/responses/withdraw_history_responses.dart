// To parse this JSON data, do
//
//     final withdrawHistoryResponse = withdrawHistoryResponseFromJson(jsonString);

import 'dart:convert';

WithdrawHistoryResponse withdrawHistoryResponseFromJson(String str) => WithdrawHistoryResponse.fromJson(json.decode(str));

String withdrawHistoryResponseToJson(WithdrawHistoryResponse data) => json.encode(data.toJson());

class WithdrawHistoryResponse {
  WithdrawHistoryResponse({
    required this.success,
    required this.data,
    required this.msg,
  });

  bool success;
  List<Datum> data;
  String msg;

  factory WithdrawHistoryResponse.fromJson(Map<String, dynamic> json) => WithdrawHistoryResponse(
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
    required this.amount,
    required this.status,
    required this.date,
  });

  int id;
  double amount;
  String status;
  DateTime date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    amount: json["amount"].toDouble(),
    status: json["status"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "status": status,
    "date": date.toIso8601String(),
  };
}
