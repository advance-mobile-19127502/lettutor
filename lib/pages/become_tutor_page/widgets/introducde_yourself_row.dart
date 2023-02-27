import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class IntroduceYourselfRow extends StatelessWidget {
  const IntroduceYourselfRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/video_introduce.svg",
          width: 100,
        ),
        const SizedBox(
          width: StyleConst.kDefaultPadding,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Introduce yourself",
                style: GoogleFonts.poppins(
                    textStyle: FontConst.medium.copyWith(fontSize: 21)),
              ),
              const SizedBox(
                height: StyleConst.kDefaultPadding / 3,
              ),
              Text(
                "Let students know what they can expect from a "
                "lesson with you by recording a video highlighting your teaching"
                " style, expertise and personality. Students can be nervous to speak"
                " with a foreigner, so it really helps to have a friendly video that introduces"
                " yourself and invites students to call you.",
                style: GoogleFonts.openSans(
                    textStyle: FontConst.regular.copyWith(fontSize: 14)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
