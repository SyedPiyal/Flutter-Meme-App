import 'package:get_it/get_it.dart';
import 'package:listview/core/service/service.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<MemesService>(() => MemesService());
}
