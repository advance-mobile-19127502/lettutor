import 'package:lettutor/models/from_api/course_info.dart';
import 'package:lettutor/repositories/base_repository.dart';

class CourseRepository extends BaseRepository {
  CourseRepository(super.baseUrl);

  Future<List<CourseInfo>> getListCourse(
      String nameCourse, Map<String, int> selectedLevel) async {
    try {
      Map<String, List<int>> tempSelectedLevel = {};
      if (selectedLevel.isNotEmpty) {
        tempSelectedLevel = {"level[]": []};
        selectedLevel.forEach((key, value) {
          tempSelectedLevel["level[]"]?.add(value);
        });
      }
      final response = await apiProvider.get(url: "", queryParams: {
        "page": 1,
        "size": 100,
        "q": nameCourse,
        ...tempSelectedLevel
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
