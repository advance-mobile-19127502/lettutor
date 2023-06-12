import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderHistoryRow extends StatelessWidget {
  const HeaderHistoryRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/history.svg",
          width: 100,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.history,
                style: GoogleFonts.poppins(
                    textStyle: FontConst.semiBold.copyWith(fontSize: 30)),
              ),
              Text(
                "${AppLocalizations.of(context)!.theFollowingListLesson}\n"
                "${AppLocalizations.of(context)!.youCanReview}",
                style: GoogleFonts.roboto(
                    textStyle: FontConst.regular.copyWith(
                        fontSize: 18, color: ColorConst.greyTextColor)),
              )
            ],
          ),
        )
      ],
    );
  }
}
