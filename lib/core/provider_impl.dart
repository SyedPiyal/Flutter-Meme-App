part of 'provider.dart';

class MemsProviderImpl extends MemsProvider {
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
  Future<RegistrationResponse?> signUp(RegistrationRequest regReq) async {
    _isLoading = true;
    notifyListeners();

    try {
      RegistrationResponse registrationResponseData =
          await memesService.registration(regReq);
      return registrationResponseData;
    } catch (e) {
      print("//--------------> $e <--------------//");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
