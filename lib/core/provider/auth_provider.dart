import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:listview/core/dataModel/login_response.dart';
import 'package:listview/core/service/auth_repo.dart';
import '../dataModel/user.dart';
import '../dataModel/registration_response.dart';
import '../service/service_locator.dart';

part 'auth_provider_impl.dart';

abstract class AuthProvider extends ChangeNotifier {
  RegistrationResponse? registrationResponse;
  LoginResponse? loginResponse;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<RegistrationResponse?> userRegistration(User regReq);

  Future<LoginResponse?> userLogin(User login);
}
