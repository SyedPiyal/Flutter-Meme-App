part of 'provider.dart';

class ProviderImpl extends MemesProvider {

  final MemesService memesService = getIt<MemesService>();
  @override
  void getMemsList() async {
    _isLoading = true;
    notifyListeners();
    try {
      Memes memesData = await memesService.getList();
      memes = memesData;
    } catch (e) {
      print("//--------------> $e <--------------//");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  Future<RegistrationResponse?> regUser(RegistrationRequest regReq) async {
    _isLoading = true;
    notifyListeners();
    try {
      RegistrationResponse response = await memesService.userReg(regReq);
      registrationResponse = response;
      return registrationResponse;
    } catch (e) {
      print("//--------------> $e <--------------//");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
