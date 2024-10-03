
import 'package:flutter/cupertino.dart';
import 'package:listview/core/auth_dataModel.dart';
import 'package:listview/core/service.dart';

import 'dataModel.dart';

part 'provider_impl.dart';

abstract class MemsProvider  extends ChangeNotifier{
  Memes? memes;
  RegistrationResponse? registrationResponse;
  final MemesService memesService = MemesService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getMemsList();

  Future<RegistrationResponse?> signUp(RegistrationRequest regReq) ;

}