// To parse this JSON data, do
//
//     final adViewResponse = adViewResponseFromJson(jsonString);

import 'dart:convert';

AdViewResponse adViewResponseFromJson(String str) => AdViewResponse.fromJson(json.decode(str));

String adViewResponseToJson(AdViewResponse data) => json.encode(data.toJson());

class AdViewResponse {
  AdViewResponse({
    required this.success,
    required this.adViewResponsess,
    required this.msg,
  });

  bool success;
  AdViewResponsess adViewResponsess;
  String msg;

  factory AdViewResponse.fromJson(Map<String, dynamic> json) => AdViewResponse(
    success: json["success"],
    adViewResponsess: AdViewResponsess.fromJson(json["data"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "AdViewResponsess": adViewResponsess.toJson(),
    "msg": msg,
  };
}

class AdViewResponsess {
  AdViewResponsess({
    required this.id,
    required this.name,
    required this.image,
    required this.link,
  });

  int id;
  String name;
  String image;
  String link;

  factory AdViewResponsess.fromJson(Map<String, dynamic> json) => AdViewResponsess(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "link": link,
  };
}
