import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/schedule.dart';
import 'package:lettutor/repositories/schedule_repository.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleRepository repository;
  List<Appointment> appointments = [];
  List<ScheduleDetails> scheduleDetailList = [];
  ScheduleBloc(this.repository) : super(ScheduleInitial()) {
    on<FetchScheduleEvent>((event, emit) async {
      emit(ScheduleLoading());
      try {
        List<Schedule> tempListSchedule = await repository.fetchScheduleTutorId(
            event.tutorId, event.startTimeStamp, event.endTimeStamp);
        for (var i in tempListSchedule) {
          for (var j in i.scheduleDetails!) {
            scheduleDetailList.add(j);
          }
        }
        // appointments = tempListSchedule.map((e) => e.toAppointment()).toList();
        // print(appointments.length);
        emit(ScheduleSuccess());
      } catch (err) {
        print(err);
        emit(ScheduleError(err.toString()));
      }
    });
  }
}
