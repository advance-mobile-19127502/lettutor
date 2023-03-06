import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/booking_schedule.dart';
import 'package:lettutor/pages/schedule_page/widgets/ava_name_schedule_container.dart';
import 'package:lettutor/pages/schedule_page/widgets/request_schedule_container.dart';
import 'package:provider/provider.dart';

class ScheduleTile extends StatefulWidget {
  const ScheduleTile({Key? key}) : super(key: key);

  @override
  State<ScheduleTile> createState() => _ScheduleTileState();
}

class _ScheduleTileState extends State<ScheduleTile> {
  late BookingSchedule schedule;
  DateFormat timeFormat = DateFormat("hh:mm");
  final dateFormat = DateFormat("EEE, dd MMM yy");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    schedule = Provider.of<BookingSchedule>(context, listen: false);
  }

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
            Text(
              dateFormat.format(schedule.startDate),
              style: GoogleFonts.roboto(
                  textStyle: FontConst.medium.copyWith(fontSize: 24)),
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 2,
            ),
            const AvaNameScheduleContainer(),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 2,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
              decoration: const BoxDecoration(color: Colors.white),
              child: Text(
                "Lesson Time: ${timeFormat.format(schedule.startDate)} - ${timeFormat.format(schedule.endDate)}",
                style: GoogleFonts.roboto(
                    textStyle: FontConst.regular.copyWith(fontSize: 20)),
              ),
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 2,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.red,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    ),
                    Text(
                      "Cancel",
                      style: GoogleFonts.roboto(
                          textStyle:
                              FontConst.regular.copyWith(color: Colors.red)),
                    )
                  ],
                )),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 2,
            ),

            const RequestScheduleContainer(),

          ],
        ),
      ),
    );
  }
}
