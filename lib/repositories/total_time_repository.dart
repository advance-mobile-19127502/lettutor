import 'package:lettutor/models/from_api/categories_course.dart';
import 'package:lettutor/repositories/base_repository.dart';

class MainRepository extends BaseRepository {
  MainRepository(super.baseUrl);
  Future<int> getTotalTimeLesson() async {
    try {
      var response = await apiProvider.get(url: "/call/total");
      return response["total"];
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Categories>> getCategories() async {
    try {
      var response = await apiProvider.get(url: "/content-category");
      Iterable l = response["rows"];
      return List<Categories>.from(l.map((e) => Categories.fromJson(e)))
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
