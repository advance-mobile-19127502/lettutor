import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/history_list.dart';
import 'package:lettutor/models/booking_history.dart';
import 'package:lettutor/models/from_api/booking_history.dart';
import 'package:lettutor/pages/history_page/widgets/ava_name_history_container.dart';
import 'package:lettutor/pages/history_page/widgets/expansion_container.dart';
import 'package:lettutor/pages/history_page/widgets/time_ago_widget.dart';
import 'package:lettutor/providers/locale_provider.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({Key? key, required this.bookingHistory}) : super(key: key);

  final BookingHistory bookingHistory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: StyleConst.kDefaultPadding),
      child: Container(
        padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TimeAgoWidget(
              startDate: DateTime.fromMillisecondsSinceEpoch(
                  bookingHistory.scheduleDetailInfo!.startPeriodTimestamp!),
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 2,
            ),
            AvaNameHistoryContainer(
              tutorInfo:
                  bookingHistory.scheduleDetailInfo!.scheduleInfo!.tutorInfo!,
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 2,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                "Lesson Time: ${bookingHistory.scheduleDetailInfo?.startPeriod} - ${bookingHistory.scheduleDetailInfo?.endPeriod}",
                style: GoogleFonts.roboto(
                    textStyle: FontConst.regular.copyWith(fontSize: 20)),
              ),
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 2,
            ),
            ExpansionContainer(
              isReview: false,
              content: bookingHistory.studentRequest,
            ),
            ExpansionContainer(
              isReview: true,
              content: bookingHistory.tutorReview,
            ),
          ],
        ),
      ),
    );
  }
}
