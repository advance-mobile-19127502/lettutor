import 'package:lettutor/models/from_api/course_info.dart';
import 'package:lettutor/repositories/base_repository.dart';

class CourseRepository extends BaseRepository {
  CourseRepository(super.baseUrl);

  Future<List<CourseInfo>> getListCourse(
      String nameCourse,
      Map<String, int> levelSelected,
      Map<String, String> categorySelected,
      Map<String, String> sortLevelSelected) async {
    try {
      Map<String, List<int>> tempLevelSelected = {};
      Map<String, List<String>> tempCategorySelected = {};
      Map<String, String> tempLevel = {};
      Map<String, List<String>> tempsortLevelSelected = {};

      if (levelSelected.isNotEmpty) {
        tempLevelSelected = {"level[]": []};
        levelSelected.forEach((key, value) {
          tempLevelSelected["level[]"]?.add(value);
        });
      }
      if (categorySelected.isNotEmpty) {
        tempCategorySelected = {"categoryId[]": []};
        categorySelected.forEach((key, value) {
          tempCategorySelected["categoryId[]"]?.add(value);
        });
      }
      if (sortLevelSelected.isNotEmpty) {
        tempLevel = {"order[]": "level"};
        tempsortLevelSelected = {"orderBy[]": []};
        sortLevelSelected.forEach((key, value) {
          tempsortLevelSelected["orderBy[]"]?.add(value);
        });
      }
      final response = await apiProvider.get(url: "", queryParams: {
        "page": 1,
        "size": 100,
        "q": nameCourse,
        ...tempLevelSelected,
        ...tempCategorySelected,
        ...tempLevel,
        ...tempsortLevelSelected
      });
      Iterable l = response["data"]["rows"];
      return List<CourseInfo>.from(l.map((e) => CourseInfo.fromJson(e)))
          .toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<CourseInfo> getCourseInfo(String courseId) async {
    try {
      final response = await apiProvider.get(url: "/$courseId");
      return CourseInfo.fromJson(response["data"]);
    } catch (err) {
      rethrow;
    }
  }
}
