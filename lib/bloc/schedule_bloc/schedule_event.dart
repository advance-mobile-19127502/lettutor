part of 'schedule_bloc.dart';

abstract class ScheduleEvent extends Equatable {
  const ScheduleEvent();
}

class FetchScheduleEvent extends ScheduleEvent {
  final String tutorId;
  final int startTimeStamp, endTimeStamp;
  const FetchScheduleEvent(
      this.tutorId, this.startTimeStamp, this.endTimeStamp);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
