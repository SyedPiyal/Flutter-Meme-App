import 'package:get_it/get_it.dart';
import 'package:listview/core/data/auth/auth_repo.dart';
import 'package:listview/core/data/memes/memes_repo.dart';
import 'package:listview/core/network/api_client.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  /// Create an instance of ApiClient
  final apiClient = ApiClient();
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<MemesRepo>(() => MemesRepo(apiClient));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(apiClient));

}
