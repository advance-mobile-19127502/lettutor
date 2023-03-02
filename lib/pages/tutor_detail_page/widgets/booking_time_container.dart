import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BookingTimeContainer extends StatelessWidget {
  const BookingTimeContainer({Key? key, required this.timeStudy})
      : super(key: key);

  final String timeStudy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2.5),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.5)))),
              child: Text(
                AppLocalizations.of(context)!.bookingTime,
                style: GoogleFonts.roboto(
                    textStyle: FontConst.semiBold.copyWith(fontSize: 14)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2.5),
              child: Container(
                padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 4),
                decoration: const BoxDecoration(
                    color: ColorConst.lightPurple,
                    borderRadius: BorderRadius.all(
                        Radius.circular(StyleConst.defaultRadius))),
                child: Text(
                  timeStudy,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.medium.copyWith(
                          fontSize: 14, color: ColorConst.purpleText)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
