import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/schedule_page/widgets/build_list_schedule_history.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/schedule_icon.svg",
                  width: 75,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Schedule",
                      style: GoogleFonts.poppins(
                          textStyle: FontConst.semiBold.copyWith(fontSize: 30)),
                    ),
                  ],
                ))
              ],
            ),
            Text(
              "Here is a list of the sessions you have booked",
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular
                      .copyWith(fontSize: 18, color: ColorConst.greyTextColor)),
            ),
            Text(
                "You can track when the meeting starts, join the meeting with one"
                " click or can cancel the meeting before 2 hours",
                style: GoogleFonts.roboto(
                    textStyle: FontConst.regular.copyWith(
                        fontSize: 18, color: ColorConst.greyTextColor))),
            const SizedBox(
              height: StyleConst.kDefaultPadding,
            ),

            const BuildListScheduleHistory(),
            // ...listScheduleExample.map((e) => Provider(
            //       create: (_) => e,
            //       child: const ScheduleTile(),
            //     ))
          ],
        ),
      ),
    );
  }
}
