import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/models/booking_history.dart';
import 'package:lettutor/providers/locale_provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeAgoWidget extends StatelessWidget {
  const TimeAgoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("TimeAgoWidget");
    // BookingHostory history =
    //     Provider.of<BookingHostory>(context, listen: false);
    // final dateFormat = DateFormat("EEE, dd MMM yy");
    //
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(
    //       dateFormat.format(history.startDate),
    //       style: GoogleFonts.roboto(
    //           textStyle: FontConst.medium.copyWith(fontSize: 24)),
    //     ),
    //     Text(
    //       timeago.format(history.startDate,
    //           clock: DateTime.now(),
    //           locale: Provider.of<LocaleProvider>(context).getLocale ==
    //                   const Locale('en')
    //               ? "en"
    //               : "vi"),
    //       style: GoogleFonts.roboto(
    //           textStyle: FontConst.regular.copyWith(fontSize: 14)),
    //     )
    //   ],
    // );
  }
}
