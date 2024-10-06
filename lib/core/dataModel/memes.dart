import 'dart:convert';

import 'data.dart';

Memes memesFromJson(String str) => Memes.fromJson(json.decode(str));

String memesToJson(Memes data) => json.encode(data.toJson());

class Memes {
  bool? success;
  Data? data;

  Memes({
    this.success,
    this.data,
  });

  factory Memes.fromJson(Map<String, dynamic> json) => Memes(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };
}




