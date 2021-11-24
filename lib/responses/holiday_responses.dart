// To parse this JSON data, do
//
//     final holidayResponse = holidayResponseFromJson(jsonString);

import 'dart:convert';

HolidayResponse holidayResponseFromJson(String str) => HolidayResponse.fromJson(json.decode(str));

String holidayResponseToJson(HolidayResponse data) => json.encode(data.toJson());

class HolidayResponse {
  HolidayResponse({
    required this.success,
    required this.data,
    required this.msg,
  });

  bool success;
  Data data;
  String msg;

  factory HolidayResponse.fromJson(Map<String, dynamic> json) => HolidayResponse(
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
    required this.holiday,
  });

  bool holiday;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    holiday: json["holiday"],
  );

  Map<String, dynamic> toJson() => {
    "holiday": holiday,
  };
}
