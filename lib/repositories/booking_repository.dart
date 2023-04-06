import 'package:lettutor/models/from_api/booking_history.dart';
import 'package:lettutor/repositories/base_repository.dart';

class BookingRepository extends BaseRepository {
  BookingRepository(super.baseUrl);

  Future<void> bookingClass(String scheduleId, String note) async {
    try {
      await apiProvider.post(url: "/booking", data: {
        "note": note,
        "scheduleDetailIds": [scheduleId]
      });
    } catch (error) {
      rethrow;
    }
  }

  Future<List<BookingHistory>> getBookedClass(int page, int perPage) async {
    try {
      var response =
          await apiProvider.get(url: "/booking/list/student", queryParams: {
        "page": page,
        "perPage": perPage,
        "orderBy": "meeting",
        "sortBy": "asc",
        "dateTimeGte": DateTime.now().millisecondsSinceEpoch
      });
      Iterable l = response["data"]["rows"];
      return List<BookingHistory>.from(l.map((e) => BookingHistory.fromJson(e)))
          .toList();
    } catch (error) {
      rethrow;
    }
  }

  Future<List<BookingHistory>> getHistoryClasses(int page) async {
    try {
      var response =
          await apiProvider.get(url: "/booking/list/student", queryParams: {
        "page": page,
        "perPage": 20,
        "orderBy": "meeting",
        "sortBy": "desc",
        "dateTimeLte": DateTime.now().millisecondsSinceEpoch
      });
      Iterable l = response["data"]["rows"];
      return List<BookingHistory>.from(l.map((e) => BookingHistory.fromJson(e)))
          .toList();
    } catch (error) {
      rethrow;
    }
  }
}
