import 'package:flutter/cupertino.dart';
import 'package:listview/core/dataModel/auth_dataModel.dart';
import 'package:listview/core/service/service.dart';
import 'package:listview/core/service/service_locator.dart';

import '../dataModel/memes_dataModel.dart';

part 'provider_impl.dart';

abstract class MemesProvider extends ChangeNotifier {
  Memes? memes;
  RegistrationResponse? registrationResponse;
  bool _isLoading = false;
  bool get isLoading => _isLoading;


  void getMemsList();
  Future<RegistrationResponse?> regUser(RegistrationRequest regReq);
}
