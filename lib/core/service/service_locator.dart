import 'package:get_it/get_it.dart';
import 'package:listview/core/service/auth_repo.dart';
import 'package:listview/core/service/memes_repo.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<MemesRepo>(() => MemesRepo());
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
}
