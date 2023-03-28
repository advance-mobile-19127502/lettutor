import 'package:lettutor/models/from_api/tutor_info.dart';
import 'package:lettutor/repositories/base_repository.dart';

class TutorRepository extends BaseRepository {
  TutorRepository(super.baseUrl);

  Future<List<TutorInfo>> getListTutorsPerPage(int perPage, int page) async {
    try {
      final response = await apiProvider
          .get(url: "/more", queryParams: {"perPage": perPage, "page": page});
      Iterable l = response["tutors"]["rows"];
      return List<TutorInfo>.from(l.map((e) => TutorInfo.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }
}
