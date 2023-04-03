import 'package:lettutor/models/from_api/filters.dart';
import 'package:lettutor/models/from_api/tutor_Info_search.dart';
import 'package:lettutor/models/from_api/tutor_info_pagination.dart';
import 'package:lettutor/repositories/base_repository.dart';

class TutorRepository extends BaseRepository {
  TutorRepository(super.baseUrl);

  Future<List<TutorInfoPagination>> getListTutorsPerPage(
      int perPage,
      int page,
      bool fetchFavoriteList,
      List<TutorInfoPagination> listFavoriteTutor) async {
    try {
      final response = await apiProvider
          .get(url: "/more", queryParams: {"perPage": perPage, "page": page});
      List<TutorInfoPagination> tempList = [];
      if (!fetchFavoriteList) {
        Iterable l = response["favoriteTutor"];
        for (var i in l) {
          if (i["secondInfo"] != null) {
            TutorInfoPagination tempTutor =
                TutorInfoPagination.fromJson(i["secondInfo"]);
            tempTutor.userId = i["secondInfo"]["tutorInfo"]["userId"];
            tempTutor.video = i["secondInfo"]["tutorInfo"]["video"];
            tempTutor.bio = i["secondInfo"]["tutorInfo"]["bio"];
            tempTutor.education = i["secondInfo"]["tutorInfo"]["education"];
            tempTutor.experience = i["secondInfo"]["tutorInfo"]["experience"];
            tempTutor.profession = i["secondInfo"]["tutorInfo"]["profession"];
            tempTutor.accent = i["secondInfo"]["tutorInfo"]["accent"];
            tempTutor.targetStudent =
                i["secondInfo"]["tutorInfo"]["targetStudent"];
            tempTutor.interests = i["secondInfo"]["tutorInfo"]["interests"];
            tempTutor.languages = i["secondInfo"]["tutorInfo"]["languages"];
            tempTutor.specialties = i["secondInfo"]["tutorInfo"]["specialties"];
            tempTutor.resume = i["secondInfo"]["tutorInfo"]["resume"];
            tempTutor.rating = i["secondInfo"]["tutorInfo"]["rating"];
            tempTutor.isActivated = i["secondInfo"]["tutorInfo"]["isActivated"];
            tempTutor.isNative = i["secondInfo"]["tutorInfo"]["isNative"];
            tempTutor.createdAt = i["secondInfo"]["tutorInfo"]["createdAt"];
            tempTutor.updatedAt = i["secondInfo"]["tutorInfo"]["updatedAt"];
            listFavoriteTutor.add(tempTutor);
          }
        }
        tempList.addAll(listFavoriteTutor);
      }
      Iterable l = response["tutors"]["rows"];
      tempList.addAll(List<TutorInfoPagination>.from(
              l.map((e) => TutorInfoPagination.fromJson(e)))
          .toList()
          .where((a) => listFavoriteTutor.every((b) => b.userId != a.userId)));
      return tempList;
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
      var temp = filters.toJson();
      print(temp);
      final response = await apiProvider.post(url: "/search", data: {
        "perPage": perPage,
        "page": page,
        "search": tutorName,
        "filters": temp
      });
      Iterable l = response["rows"];
      return List<TutorInfoPagination>.from(
          l.map((e) => TutorInfoPagination.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }
}
