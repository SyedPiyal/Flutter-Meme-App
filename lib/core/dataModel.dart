import 'dart:convert';

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

class Data {
  List<Meme>? memes;

  Data({
    this.memes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    memes: json["memes"] == null ? [] : List<Meme>.from(json["memes"]!.map((x) => Meme.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "memes": memes == null ? [] : List<dynamic>.from(memes!.map((x) => x.toJson())),
  };
}

class Meme {
  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? boxCount;
  int? captions;

  Meme({
    this.id,
    this.name,
    this.url,
    this.width,
    this.height,
    this.boxCount,
    this.captions,
  });

  factory Meme.fromJson(Map<String, dynamic> json) => Meme(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    width: json["width"],
    height: json["height"],
    boxCount: json["box_count"],
    captions: json["captions"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "width": width,
    "height": height,
    "box_count": boxCount,
    "captions": captions,
  };
}
