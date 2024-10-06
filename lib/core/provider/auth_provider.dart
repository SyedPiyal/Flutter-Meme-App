import 'package:flutter/foundation.dart';
import 'package:listview/core/dataModel/login_response.dart';
import 'package:listview/core/data/auth_repo.dart';
import '../dataModel/user.dart';
import '../dataModel/registration_response.dart';
import '../service/service_locator.dart';

class AuthProvider extends ChangeNotifier {
  RegistrationResponse? registrationResponse;
  LoginResponse? loginResponse;
  bool _isLoading = false;

  /// Create an instance of AuthRepo
  final AuthRepo authRepo = getIt.get<AuthRepo>();

  bool get isLoading => _isLoading;

  /// method to register user

  Future<RegistrationResponse?> userRegistration(User regReq) async {
    ///  Set loading state to true
    _isLoading = true;
    notifyListeners();
    try {
      /// register new user
      RegistrationResponse response = await authRepo.userReg(regReq);
      registrationResponse = response;
      return registrationResponse;
    } catch (e) {
      /// If an error occurs, print it in debug mode
      if (kDebugMode) {
        debugPrint("$e");
      }
    } finally {
      /// Set loading state to false when api call finished
      _isLoading = false;
      notifyListeners();
    }
  }

  /// method to login user

  Future<LoginResponse?> userLogin(User login) async {
    ///  Set loading state to true
    _isLoading = true;
    notifyListeners();
    try {
      /// login user
      LoginResponse response = await authRepo.userLogin(login);
      loginResponse = response;
      return loginResponse;
    } catch (e) {
      /// If an error occurs, print it in debug mode
      if (kDebugMode) {
        debugPrint("$e");
      }
    } finally {
      /// Set loading state to false when api call finished
      _isLoading = false;
      notifyListeners();
    }
  }
}
