import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:listview/core/dataModel/auth_dataModel.dart';
import 'package:listview/core/dataModel/memes_dataModel.dart';

class MemesService {
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

  Future<RegistrationResponse> userReg(RegistrationRequest regReq) async {
    final userRreg = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(regReq));
    if (userRreg.statusCode == 200) {
      final resBdy = jsonDecode(userRreg.body);
      return RegistrationResponse.fromJson(resBdy);
    } else {
      throw Exception("error not");
    }
  }
}
