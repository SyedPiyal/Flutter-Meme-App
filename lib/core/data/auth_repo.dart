import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listview/core/dataModel/user.dart';
import '../dataModel/login_response.dart';
import '../dataModel/registration_response.dart';

class AuthRepo {

  ///
  /// post request to register user
  ///
  Future<RegistrationResponse> userReg(User regReq) async {
    final userRegistration = await http.post(
        Uri.parse("https://reqres.in/api/register"),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(regReq));
    if (userRegistration.statusCode == 200) {
      final responseBody = jsonDecode(userRegistration.body);
      return RegistrationResponse.fromJson(responseBody);
    } else {
      throw Exception("error not");
    }
  }

  ///
  /// post request to login user
  ///
  Future<LoginResponse> userLogin(User loginUser) async {
    final userLogin = await http.post(Uri.parse("https://reqres.in/api/login"),
        headers: {"Content-Type": "Application/json"},
        body: jsonEncode(loginUser));
    if (userLogin.statusCode == 200) {
      final responseBody = jsonDecode(userLogin.body);
      return LoginResponse.fromJson(responseBody);
    } else {
      throw Exception("error not");
    }
  }
}
