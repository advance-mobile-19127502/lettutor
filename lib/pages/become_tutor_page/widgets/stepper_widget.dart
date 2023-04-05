import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({Key? key, required this.currentIndex}) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor:
                    currentIndex == 0 ? Colors.blue : Colors.transparent,
                child: currentIndex > 0
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : Text(
                        "1",
                        style: TextStyle(
                            color:
                                currentIndex == 0 ? Colors.white : Colors.grey),
                      ),
              ),
            ),
            const SizedBox(
              width: StyleConst.kDefaultPadding,
            ),
            Text(
              AppLocalizations.of(context)!.completeProfile,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular.copyWith(
                      fontSize: 16,
                      color: currentIndex == 0 ? Colors.black : Colors.grey)),
            )
          ],
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor:
                    currentIndex == 1 ? Colors.blue : Colors.transparent,
                child: currentIndex > 1
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : Text(
                        "2",
                        style: TextStyle(
                            color:
                                currentIndex == 1 ? Colors.white : Colors.grey),
                      ),
              ),
            ),
            const SizedBox(
              width: StyleConst.kDefaultPadding,
            ),
            Text(
              AppLocalizations.of(context)!.videoIntroduction,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular.copyWith(
                      fontSize: 16,
                      color: currentIndex == 1 ? Colors.black : Colors.grey)),
            )
          ],
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor:
                    currentIndex == 2 ? Colors.blue : Colors.transparent,
                child: currentIndex > 2
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    : Text(
                        "3",
                        style: TextStyle(
                            color:
                                currentIndex == 2 ? Colors.white : Colors.grey),
                      ),
              ),
            ),
            const SizedBox(
              width: StyleConst.kDefaultPadding,
            ),
            Text(
              AppLocalizations.of(context)!.approval,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular.copyWith(
                      fontSize: 16,
                      color: currentIndex == 2 ? Colors.black : Colors.grey)),
            )
          ],
        ),
      ],
    );
  }
}
