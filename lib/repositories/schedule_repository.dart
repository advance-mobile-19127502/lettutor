import 'package:lettutor/models/from_api/schedule.dart';
import 'package:lettutor/repositories/base_repository.dart';

class ScheduleRepository extends BaseRepository {
  ScheduleRepository(super.baseUrl);

  Future<List<Schedule>> fetchScheduleTutorId(
      String tutorId, int startDateTimeStamp, int endDateTimeStamp) async {
    try {
      final response = await apiProvider.get(url: "/schedule", queryParams: {
        "tutorId": tutorId,
        "startTimestamp": startDateTimeStamp,
        "endTimestamp": endDateTimeStamp
      });
      Iterable l = response["scheduleOfTutor"];
      return List<Schedule>.from(l.map((e) => Schedule.fromJson(e))).toList();
    } catch (err) {
      rethrow;
    }
  }
}
