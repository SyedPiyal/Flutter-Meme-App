import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listview/core/dataModel/registration_request.dart';
import '../dataModel/registration_response.dart';

class AuthRepo {
  ///
  /// post request to register user
  ///
  Future<RegistrationResponse> userReg(RegistrationRequest regReq) async {
    final userRegistration = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(regReq));
    if (userRegistration.statusCode == 200) {
      final resBdy = jsonDecode(userRegistration.body);
      return RegistrationResponse.fromJson(resBdy);
    } else {
      throw Exception("error not");
    }
  }
}
