import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class BalancePriceContainer extends StatelessWidget {
  const BalancePriceContainer({Key? key, required this.balance, required this.price}) : super(key: key);

  final int balance, price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: StyleConst.kDefaultPadding,
          right: StyleConst.kDefaultPadding,
          bottom: StyleConst.kDefaultPadding),
      child: Container(
        padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2.5),
        decoration: BoxDecoration(
          color: Colors.grey[100],
            border: Border.all(color: Colors.grey.withOpacity(0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.balance,
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.medium.copyWith(fontSize: 16)),
                ),
                Text(AppLocalizations.of(context)!.haveNumLessonLeft(balance),
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular.copyWith(
                            fontSize: 16, color: ColorConst.purpleText)))
              ],
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 2.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.price,
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.medium.copyWith(fontSize: 16)),
                ),
                Text(AppLocalizations.of(context)!.priceLesson(price),
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular.copyWith(
                            fontSize: 16, color: ColorConst.purpleText)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
