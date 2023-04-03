import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:lettutor/bloc/total_time_bloc/total_time_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrentCourse extends StatelessWidget {
  const CurrentCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Text(AppLocalizations.of(context)!.noUpcomingLesson,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: FontConst.regular
                    .copyWith(fontSize: 30, color: Colors.white),
              )),
          const SizedBox(
            height: StyleConst.kDefaultPadding,
          ),
          ElevatedButton(
              onPressed: () async {
                var options = JitsiMeetingOptions(roomNameOrUrl: 'my-room');
                await JitsiMeetWrapper.joinMeeting(
                  options: options,
                  listener: JitsiMeetingListener(
                    onConferenceWillJoin: (url) =>
                        print("onConferenceWillJoin: url: $url"),
                    onConferenceJoined: (url) =>
                        print("onConferenceJoined: url: $url"),
                    onConferenceTerminated: (url, error) => print(
                        "onConferenceTerminated: url: $url, error: $error"),
                  ),
                );
              },
              child: const Text("Enter lesson room")),
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
  }
}
