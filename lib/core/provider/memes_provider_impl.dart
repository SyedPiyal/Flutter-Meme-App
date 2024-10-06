part of 'memes_provider.dart';

class ProviderImpl extends MemesProvider {
  /// Create an instance of MemesRepo
  final MemesRepo memesService = getIt<MemesRepo>();

  @override
  void getMemesList() async {
    ///  Set loading state to true to indicate that data is being fetched
    _isLoading = true;
    notifyListeners();
    try {
      /// fetched memes data
      Memes memesData = await memesService.getList();
      memes = memesData;
    } catch (e) {
      /// If an error occurs, print it in debug mode
      if (kDebugMode) {
        debugPrint("$e");
      }
    } finally {
      /// Set loading state to false when data load complete
      _isLoading = false;
      notifyListeners();
    }
  }
}
