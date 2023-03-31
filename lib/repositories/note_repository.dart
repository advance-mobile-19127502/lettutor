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
}
