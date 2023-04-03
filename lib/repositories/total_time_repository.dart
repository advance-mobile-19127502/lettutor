import 'package:lettutor/repositories/base_repository.dart';

class TotalTimeRepository extends BaseRepository {
  TotalTimeRepository(super.baseUrl);
  Future<int> getTotalTimeLesson() async {
    try {
      var response = await apiProvider.get(url: "/call/total");
      return response["total"];
    } catch (error) {
      rethrow;
    }
  }
}
