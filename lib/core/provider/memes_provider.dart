import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:listview/core/service/memes_repo.dart';
import 'package:listview/core/service/service_locator.dart';
import '../dataModel/memes.dart';

part 'memes_provider_impl.dart';

abstract class MemesProvider extends ChangeNotifier {

  Memes? memes;
  bool _isLoading = false;

  /// get method for loading
  bool get isLoading => _isLoading;

  /// get list data
  void getMemesList();

}
