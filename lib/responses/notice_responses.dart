// To parse this JSON data, do
//
//     final noticeResponse = noticeResponseFromJson(jsonString);

import 'dart:convert';

NoticeResponse noticeResponseFromJson(String str) => NoticeResponse.fromJson(json.decode(str));

String noticeResponseToJson(NoticeResponse data) => json.encode(data.toJson());

class NoticeResponse {
  NoticeResponse({
    required this.success,
    required this.noticeResponsess,
    required this.msg,
  });

  bool success;
  List<NoticeResponsess> noticeResponsess;
  String msg;

  factory NoticeResponse.fromJson(Map<String, dynamic> json) => NoticeResponse(
    success: json["success"],
    noticeResponsess: List<NoticeResponsess>.from(json["NoticeResponsess"].map((x) => NoticeResponsess.fromJson(x))),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "NoticeResponsess": List<dynamic>.from(noticeResponsess.map((x) => x.toJson())),
    "msg": msg,
  };
}

class NoticeResponsess {
  NoticeResponsess({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
  });

  int id;
  String title;
  String message;
  DateTime time;

  factory NoticeResponsess.fromJson(Map<String, dynamic> json) => NoticeResponsess(
    id: json["id"],
    title: json["title"],
    message: json["message"],
    time: DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "message": message,
    "time": time.toIso8601String(),
  };
}
