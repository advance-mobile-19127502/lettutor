

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class AvaSetUpWidget extends StatelessWidget {
  const AvaSetUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
            backgroundImage:
            AssetImage("assets/images/set_up_tutor_profile.png"),
            radius: 50),
        const SizedBox(
          width: StyleConst.kDefaultPadding,
        ),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set up your tutor profile",
                  style: GoogleFonts.poppins(
                      textStyle: FontConst.medium.copyWith(fontSize: 21)),
                ),
                Text(
                  "Your tutor profile is your chance to market yourself to "
                      "students on Tutoring. You can make edits later on your profile settings page. \n",
                  style: GoogleFonts.openSans(
                      textStyle: FontConst.regular.copyWith(fontSize: 14)),
                ),
                Text(
                  "New students may browse tutor profiles to find a"
                      " tutor that fits their learning goals and personality. Returning students "
                      "may use the tutor profiles to find tutors they've had great experiences with already.",
                  style: GoogleFonts.openSans(
                      textStyle: FontConst.regular.copyWith(fontSize: 14)),
                )
              ],
            ))
      ],
    );
  }
}
