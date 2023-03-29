import 'package:lettutor/models/from_api/filters.dart';
import 'package:lettutor/models/from_api/tutor_Info_search.dart';
import 'package:lettutor/models/from_api/tutor_info_pagination.dart';
import 'package:lettutor/repositories/base_repository.dart';

class TutorRepository extends BaseRepository {
  TutorRepository(super.baseUrl);

  Future<List<TutorInfoPagination>> getListTutorsPerPage(
      int perPage, int page) async {
    try {
      final response = await apiProvider
          .get(url: "/more", queryParams: {"perPage": perPage, "page": page});
      Iterable l = response["tutors"]["rows"];
      return List<TutorInfoPagination>.from(
          l.map((e) => TutorInfoPagination.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<TutorInfoSearch> getTutorInfoSearch(String tutorId) async {
    try {
      final response = await apiProvider.get(url: "/$tutorId");
      return TutorInfoSearch.fromJson(response);
    } catch (err) {
      rethrow;
    }
  }

  Future<List<TutorInfoPagination>> filterTutorList(
      int perPage, int page, Filters filters, String tutorName) async {
    try {
      final response = await apiProvider.post(url: "/search", data: {
        "perPage": perPage,
        "page": page,
        "search": tutorName,
        "filters": filters.toJson()
      });
      Iterable l = response["rows"];
      return List<TutorInfoPagination>.from(
          l.map((e) => TutorInfoPagination.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }
}
