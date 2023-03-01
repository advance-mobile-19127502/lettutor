import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                AppLocalizations.of(context)!.introduceYourself,
                style: GoogleFonts.poppins(
                    textStyle: FontConst.medium.copyWith(fontSize: 21)),
              ),
              const SizedBox(
                height: StyleConst.kDefaultPadding / 3,
              ),
              Text(
                AppLocalizations.of(context)!.letStudentKnowWhat,
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
