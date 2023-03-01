

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      decoration: const BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorConst.lightBlue,
            ColorConst.darkBlue
          ]
      )),
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
          Text(
            AppLocalizations.of(context)!.welcomeTo,
            style: GoogleFonts.roboto(
                textStyle: FontConst.regular
                    .copyWith(fontSize: 16, color: Colors.white)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
