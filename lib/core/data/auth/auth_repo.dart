import 'package:listview/core/dataModel/user.dart';
import 'package:listview/utils/api_consts.dart';
import '../../dataModel/login_response.dart';
import '../../dataModel/registration_response.dart';
import '../../network/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;

  AuthRepo(this.apiClient);

  ///
  /// post request to register user --> return registration response
  ///

  Future<RegistrationResponse> userReg(User regReq) async {
    final responseBody = await apiClient.post(
      customBaseUrl: AppApiConstants.authBaseUrl,
      endpoint: AppApiConstants.authRegisterUrl,
      body: regReq,
    );
    return RegistrationResponse.fromJson(responseBody);
  }

  ///
  /// post request to login user --> return login response
  ///
  Future<LoginResponse> userLogin(User loginUser) async {
    final responseBody = await apiClient.post(
      customBaseUrl: AppApiConstants.authBaseUrl,
      endpoint: AppApiConstants.authLoginUrl,
      body: loginUser,
    );
    return LoginResponse.fromJson(responseBody);
  }
}
