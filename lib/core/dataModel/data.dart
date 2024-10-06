import 'meme.dart';


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