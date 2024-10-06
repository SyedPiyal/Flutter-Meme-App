part of 'auth_provider.dart';

class AuthProviderImpl extends AuthProvider {
  /// Create an instance of AuthRepo
  final AuthRepo authRepo = getIt<AuthRepo>();

  @override
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

  @override
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
