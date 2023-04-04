import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/models/booking_history.dart';
import 'package:lettutor/providers/locale_provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeAgoWidget extends StatelessWidget {
  const TimeAgoWidget({Key? key, required this.startDate}) : super(key: key);

  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("EEE, dd MMM yy");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dateFormat.format(startDate),
          style: GoogleFonts.roboto(
              textStyle: FontConst.medium.copyWith(fontSize: 24)),
        ),
        Text(
          timeago.format(startDate, clock: DateTime.now(), locale: "en"),
          // locale: Provider.of<LocaleProvider>(context).getLocale ==
          //         const Locale('en')
          //     ? "en"
          //     : "vi"),
          style: GoogleFonts.roboto(
              textStyle: FontConst.regular.copyWith(fontSize: 14)),
        )
      ],
    );
  }
}
