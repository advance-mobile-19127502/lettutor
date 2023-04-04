import 'package:lettutor/models/from_api/course_info.dart';
import 'package:lettutor/repositories/base_repository.dart';

class CourseRepository extends BaseRepository {
  CourseRepository(super.baseUrl);

  Future<List<CourseInfo>> getListCourse() async {
    try {
      final response =
          await apiProvider.get(url: "", queryParams: {"page": 1, "size": 100});
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
