// To parse this JSON data, do
//
//     final districtResponse = districtResponseFromJson(jsonString);

import 'dart:convert';

DistrictResponse districtResponseFromJson(String str) => DistrictResponse.fromJson(json.decode(str));

String districtResponseToJson(DistrictResponse data) => json.encode(data.toJson());

class DistrictResponse {
  DistrictResponse({
    required this.success,
    required this.data,
    required this.msg,
  });

  bool success;
  List<Datum> data;
  String msg;

  factory DistrictResponse.fromJson(Map<String, dynamic> json) => DistrictResponse(
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
    required this.division,
    required this.divisionId,
    required this.name,
  });

  int id;
  String division;
  int divisionId;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    division: json["division"],
    divisionId: json["division_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "division": division,
    "division_id": divisionId,
    "name": name,
  };
}
