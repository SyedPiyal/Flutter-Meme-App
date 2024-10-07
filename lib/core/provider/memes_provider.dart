import 'package:flutter/foundation.dart';
import 'package:listview/core/data/memes/memes_repo.dart';
import 'package:listview/core/service/service_locator.dart';
import '../dataModel/memes.dart';

class MemesProvider extends ChangeNotifier {
  Memes? memes;
  bool _isLoading = false;

  /// get method for loading
  bool get isLoading => _isLoading;

  /// Create an instance of MemesRepo
  final MemesRepo memesService = getIt<MemesRepo>();

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
