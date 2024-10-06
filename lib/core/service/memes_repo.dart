import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listview/core/dataModel/memes.dart';

class MemesRepo {
  /// get request to get memes list data
  /// this method will return Memes data
  ///
  Future<Memes> getList() async {
    final response = await http.get(
        Uri.parse("https://api.imgflip.com/get_memes"),
        headers: {"Content-Type": "Application/json"});
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return Memes.fromJson(responseBody);
    } else {
      throw Exception("Error");
    }
  }
}
