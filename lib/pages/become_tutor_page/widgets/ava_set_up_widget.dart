import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              AppLocalizations.of(context)!.setUpTutorProfile,
              style: GoogleFonts.poppins(
                  textStyle: FontConst.medium.copyWith(fontSize: 21)),
            ),
            Text(
              "${AppLocalizations.of(context)!.yourTutorProfile}\n",
              style: GoogleFonts.openSans(
                  textStyle: FontConst.regular.copyWith(fontSize: 14)),
            ),
            Text(AppLocalizations.of(context)!.newStudentMay,
              style: GoogleFonts.openSans(
                  textStyle: FontConst.regular.copyWith(fontSize: 14)),
            )
          ],
        ))
      ],
    );
  }
}
