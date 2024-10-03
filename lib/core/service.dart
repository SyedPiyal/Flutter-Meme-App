import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:listview/core/auth_dataModel.dart';
import 'package:listview/core/dataModel.dart';

class MemesService {
  Future<Memes> getList() async {
    final res = await http.get(Uri.parse("https://api.imgflip.com/get_memes"),
        headers: {"Content-Type": "Application/json"});
    if (res.statusCode == 200) {
      final resBdy = jsonDecode(res.body);
      return Memes.fromJson(resBdy);
    } else {
      throw Exception("Error");
    }
  }

  Future<RegistrationResponse> registration(
      RegistrationRequest regisReq) async {
    final regReq = await http.post(
      Uri.parse("https://reqres.in/api/register"),
      headers: {"Content-Type": "Application/json","Accept":"Application/json"},
      body: jsonEncode(regisReq.toJson()),
    );
    print("//--------------> ${regReq.statusCode} <--------------//");
    if (regReq.statusCode == 200) {
      final reqBdy = jsonDecode(regReq.body);
      return RegistrationResponse.fromJson(reqBdy);
    } else {
      throw Exception("Error");
    }
  }
}
