import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/bloc/booking_bloc/booking_bloc.dart';
import 'package:lettutor/bloc/schedule_bloc/schedule_bloc.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/models/from_api/schedule.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/booking_dialog.dart';
import 'package:lettutor/repositories/note_repository.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TimeTableWidget extends StatefulWidget {
  const TimeTableWidget({Key? key, required this.tutorId}) : super(key: key);
  final String tutorId;

  @override
  State<TimeTableWidget> createState() => _TimeTableWidgetState();
}

class _TimeTableWidgetState extends State<TimeTableWidget> {
  final DateTime _curentDate = DateTime.now();
  late ScheduleBloc scheduleBloc;
  late DateTime _startDay, _endDay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scheduleBloc = BlocProvider.of<ScheduleBloc>(context);
    _startDay =
        DateTime(_curentDate.year, _curentDate.month, _curentDate.day, 0, 0, 0);
    _endDay = _startDay
        .add(const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));
    scheduleBloc.add(FetchScheduleEvent(widget.tutorId,
        _startDay.millisecondsSinceEpoch, _endDay.millisecondsSinceEpoch));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      bloc: scheduleBloc,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: _startDay.isAtSameMomentAs(_curentDate) ||
                            _startDay.isBefore(_curentDate)
                        ? null
                        : () {
                            _decreaseStartDate();
                          },
                    icon: const Icon(Icons.arrow_back_ios)),
                IconButton(
                    onPressed: () {
                      _increaseStartDate();
                    },
                    icon: const Icon(Icons.arrow_forward_ios)),
                Text(
                    "${DateFormat("dd/MM").format(_startDay)} - ${DateFormat("dd/MM").format(_endDay)}, "
                    "${_curentDate.year}")
              ],
            ),
            if (state is ScheduleLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (state is ScheduleError)
              Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              )
            else
              SfCalendar(
                minDate: _startDay,
                maxDate: _endDay,
                onTap: null,
                dataSource:
                    _getCalendarDataSource(scheduleBloc.scheduleDetailList),
                backgroundColor: Colors.white,
                cellBorderColor: Colors.black,
                appointmentBuilder: (context, calendarAppointmentDetails) {
                  BookingBloc bookingBloc =
                      BookingBloc(BookingRepository(UrlConst.baseUrl));
                  return BlocProvider(
                    create: (context) => bookingBloc,
                    child: BlocConsumer<BookingBloc, BookingState>(
                      listener: (context, state) {
                        if (state is BookingSuccess) {
                          calendarAppointmentDetails
                              .appointments.first.subject = "Booked";
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            state is BookingSuccess
                                ? const Text(
                                    "Booked",
                                    style: TextStyle(color: Colors.green),
                                  )
                                : calendarAppointmentDetails
                                            .appointments.first.subject ==
                                        "Booked"
                                    ? const Text(
                                        "Booked",
                                        style: TextStyle(color: Colors.green),
                                      )
                                    : SizedBox(
                                        width: calendarAppointmentDetails
                                                .bounds.width /
                                            3,
                                        child: ElevatedButton(
                                            onPressed:
                                                calendarAppointmentDetails
                                                            .appointments
                                                            .first
                                                            .subject ==
                                                        "Unable to book"
                                                    ? null
                                                    : () async {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    BlocProvider
                                                                        .value(
                                                                      value:
                                                                          bookingBloc,
                                                                      child:
                                                                          BookingDialog(
                                                                        appointment: calendarAppointmentDetails
                                                                            .appointments
                                                                            .first,
                                                                      ),
                                                                    ));
                                                      },
                                            style: ElevatedButton.styleFrom(
                                                shape: const StadiumBorder()),
                                            child: const Text("Book")))
                          ],
                        );
                      },
                    ),
                  );
                },
                timeSlotViewSettings: const TimeSlotViewSettings(
                    timeIntervalHeight: 100,
                    timeInterval: Duration(minutes: 30),
                    timeFormat: "HH:mm"),
              )
          ],
        );
      },
    );
  }

  void _increaseStartDate() {
    _startDay = _startDay.add(const Duration(days: 7));
    _endDay = _startDay
        .add(const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));
    scheduleBloc.add(FetchScheduleEvent(widget.tutorId,
        _startDay.millisecondsSinceEpoch, _endDay.millisecondsSinceEpoch));
  }

  void _decreaseStartDate() {
    _startDay = _startDay.subtract(const Duration(days: 7));
    _endDay = _endDay.subtract(const Duration(days: 7, seconds: 1));
    scheduleBloc.add(FetchScheduleEvent(widget.tutorId,
        _startDay.millisecondsSinceEpoch, _endDay.millisecondsSinceEpoch));
  }

  MeetingDataSource _getCalendarDataSource(
      List<ScheduleDetails> scheduleDetailList) {
    List<Appointment> appointments = <Appointment>[];
    for (ScheduleDetails i in scheduleDetailList) {
      String temp = "";
      if (i.isBooked!) {
        temp = "Booked";
      } else if (DateTime.now().millisecondsSinceEpoch >=
          i.startPeriodTimestamp!) {
        temp = "Unable to book";
      } else {
        temp = "Book";
      }
      appointments.add(Appointment(
          startTime:
              DateTime.fromMillisecondsSinceEpoch(i.startPeriodTimestamp!),
          endTime: DateTime.fromMillisecondsSinceEpoch(i.endPeriodTimestamp!),
          id: i.id,
          subject: temp));
    }
    return MeetingDataSource(appointments);
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
