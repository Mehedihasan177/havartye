// To parse this JSON data, do
//
//     final transactionResponse = transactionResponseFromJson(jsonString);

import 'dart:convert';

TransactionResponse transactionResponseFromJson(String str) => TransactionResponse.fromJson(json.decode(str));

String transactionResponseToJson(TransactionResponse data) => json.encode(data.toJson());

class TransactionResponse {
  TransactionResponse({
    required this.success,
    required this.transactionRes,
    required this.msg,
  });

  bool success;
  List<TransactionRe> transactionRes;
  String msg;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) => TransactionResponse(
    success: json["success"],
    transactionRes: List<TransactionRe>.from(json["TransactionRes"].map((x) => TransactionRe.fromJson(x))),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "TransactionRes": List<dynamic>.from(transactionRes.map((x) => x.toJson())),
    "msg": msg,
  };
}

class TransactionRe {
  TransactionRe({
    required this.id,
    required this.transactionId,
    required this.title,
    required this.user,
    required this.affliate,
    required this.type,
    required this.wallet,
    required this.amount,
    required this.createdAt,
  });

  int id;
  String transactionId;
  String title;
  String user;
  String affliate;
  String type;
  String wallet;
  int amount;
  DateTime createdAt;

  factory TransactionRe.fromJson(Map<String, dynamic> json) => TransactionRe(
    id: json["id"],
    transactionId: json["transaction_id"],
    title: json["title"],
    user: json["user"],
    affliate: json["affliate"],
    type: json["type"],
    wallet: json["wallet"],
    amount: json["amount"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "transaction_id": transactionId,
    "title": title,
    "user": user,
    "affliate": affliate,
    "type": type,
    "wallet": wallet,
    "amount": amount,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
  };
}
