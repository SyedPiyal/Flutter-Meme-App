import 'package:listview/core/dataModel/memes.dart';
import '../../../utils/api_consts.dart';
import '../../network/api_client.dart';

class MemesRepo {
  ///
  /// get request to get memes list data
  /// this method will return Memes data
  ///
  final ApiClient apiClient;

  MemesRepo(this.apiClient);

  Future<Memes> getList() async {
    final responseBody = await apiClient.get(
        customBaseUrl: AppApiConstants.memesBaseUrl, endpoint: AppApiConstants.memesEndUrl);
    return Memes.fromJson(responseBody);
  }
}
