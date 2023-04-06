import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:lettutor/bloc/booking_history_bloc/booking_history_bloc.dart';
import 'package:lettutor/bloc/total_time_bloc/total_time_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/models/from_api/booking_history.dart';

class CurrentCourse extends StatefulWidget {
  const CurrentCourse({Key? key}) : super(key: key);

  @override
  State<CurrentCourse> createState() => _CurrentCourseState();
}

class _CurrentCourseState extends State<CurrentCourse> {
  late BookingHistoryBloc bookingHistoryBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookingHistoryBloc = BlocProvider.of<BookingHistoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHistoryBloc, BookingHistoryState>(
      bloc: bookingHistoryBloc,
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [ColorConst.lightBlue, ColorConst.darkBlue])),
          child: Column(
            children: [
              Text(
                  bookingHistoryBloc.listBookingHistory.isNotEmpty
                      ? "Upcoming lesson"
                      : AppLocalizations.of(context)!.noUpcomingLesson,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: FontConst.regular
                        .copyWith(fontSize: 30, color: Colors.white),
                  )),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              if (bookingHistoryBloc.listBookingHistory.isNotEmpty)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                            text: TextSpan(
                                style: GoogleFonts.roboto(
                                    textStyle: FontConst.regular
                                        .copyWith(fontSize: 20)),
                                children: [
                              TextSpan(
                                  text: DateFormat("EEE, MMM dd hh:mm").format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          bookingHistoryBloc
                                                  .listBookingHistory
                                                  .first
                                                  .scheduleDetailInfo
                                                  ?.startPeriodTimestamp ??
                                              0))),
                              TextSpan(
                                  text: DateFormat(" - hh:mm ").format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          bookingHistoryBloc
                                                  .listBookingHistory
                                                  .first
                                                  .scheduleDetailInfo
                                                  ?.endPeriodTimestamp ??
                                              0))),
                            ])),
                        if (DateTime.now().isBefore(
                            DateTime.fromMillisecondsSinceEpoch(
                                bookingHistoryBloc
                                        .listBookingHistory
                                        .first
                                        .scheduleDetailInfo
                                        ?.endPeriodTimestamp ??
                                    0)))
                          Flexible(
                            child: CountdownTimer(
                              endTime: bookingHistoryBloc
                                  .listBookingHistory
                                  .first
                                  .scheduleDetailInfo
                                  ?.startPeriodTimestamp,
                              widgetBuilder: (_, remainingTime) {
                                if (remainingTime == null) {
                                  return Text("(Class has started)",
                                      style: GoogleFonts.roboto(
                                          textStyle: FontConst.regular.copyWith(
                                              fontSize: 16,
                                              color: Colors.yellowAccent)));
                                } else {
                                  return Text(
                                      "(starts in ${remainingTime.hours ?? 0}:${remainingTime.min ?? 0}:${remainingTime.sec ?? 0})",
                                      style: GoogleFonts.roboto(
                                          textStyle: FontConst.regular.copyWith(
                                              fontSize: 16,
                                              color: Colors.yellowAccent)));
                                }
                              },
                            ),
                          )
                        else
                          Text("(Class has started)",
                              style: GoogleFonts.roboto(
                                  textStyle: FontConst.regular.copyWith(
                                      fontSize: 16,
                                      color: Colors.yellowAccent))),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          _initJitsi(
                              bookingHistoryBloc.listBookingHistory.first);
                        },
                        child: const Text("Enter lesson room")),
                  ],
                ),
              BlocBuilder<TotalTimeBloc, TotalTimeState>(
                bloc: BlocProvider.of<TotalTimeBloc>(context),
                builder: (context, state) {
                  if (state is TotalTimeSuccess) {
                    return Text(
                      "Total lesson time is ${state.totalLessonLearned}",
                      style: GoogleFonts.roboto(
                          textStyle: FontConst.regular
                              .copyWith(fontSize: 16, color: Colors.white)),
                      textAlign: TextAlign.center,
                    );
                  }
                  return Text(
                    "Total lesson time is 0 hour",
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular
                            .copyWith(fontSize: 16, color: Colors.white)),
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _initJitsi(BookingHistory bookingInfo) async {
    var options = JitsiMeetingOptions(
        roomNameOrUrl: bookingInfo.scheduleDetailId ?? "",
        serverUrl: UrlConst.mettingUrl,
        token: bookingInfo.studentMeetingLink?.split("?token=").last,
        subject:
            "${bookingInfo.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name}'s meeting");
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (url) =>
              print("onConferenceWillJoin: url: $url"),
          onConferenceJoined: (url) => print("onConferenceJoined: url: $url"),
          onConferenceTerminated: (url, error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    // "Failed to join class meeting. Please try again!",
                    "onConferenceTerminated: url: $url, error: $error"),
              ),
            );
            print("onConferenceTerminated: url: $url, error: $error");
          }),
    );
  }
}
