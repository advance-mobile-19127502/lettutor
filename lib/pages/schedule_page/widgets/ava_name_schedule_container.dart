import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/booking_schedule.dart';

class AvaNameScheduleContainer extends StatelessWidget {
  const AvaNameScheduleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BookingSchedule schedule =
    //     Provider.of<BookingSchedule>(context, listen: false);
    return Text("AvaNameScheduleContainer");

    // return Container(
    //   padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
    //   decoration: const BoxDecoration(color: Colors.white),
    //   child: Row(
    //     children: [
    //       CircleAvatar(
    //         backgroundImage: NetworkImage(schedule.avaTutorUrl),
    //         radius: 25,
    //       ),
    //       const SizedBox(
    //         width: StyleConst.kDefaultPadding / 2,
    //       ),
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               schedule.nameTutor,
    //               style: GoogleFonts.roboto(
    //                   textStyle: FontConst.medium.copyWith(fontSize: 20)),
    //             ),
    //             Text(schedule.countryTutor,
    //                 style: GoogleFonts.roboto(
    //                     textStyle: FontConst.regular.copyWith(fontSize: 14))),
    //             TextButton(
    //                 onPressed: () {},
    //                 style: TextButton.styleFrom(
    //                   minimumSize: Size.zero,
    //                   padding: EdgeInsets.zero,
    //                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //                 ),
    //                 child: Text("Direct Message",
    //                     style: GoogleFonts.roboto(
    //                         textStyle:
    //                             FontConst.regular.copyWith(fontSize: 14))))
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
