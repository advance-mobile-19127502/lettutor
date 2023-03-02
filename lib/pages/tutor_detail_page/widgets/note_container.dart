import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class NoteContainer extends StatelessWidget {
  const NoteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: StyleConst.kDefaultPadding,
          right: StyleConst.kDefaultPadding,
          bottom: StyleConst.kDefaultPadding),
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
                "Note",
                style: GoogleFonts.roboto(
                    textStyle: FontConst.semiBold.copyWith(fontSize: 14)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2.5),
              child: TextField(
                minLines: 6,
                maxLines: 6,
                decoration: const InputDecoration(
                  isDense: true,
                    border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorConst.hintTextColor),
                )),
                style: GoogleFonts.roboto(
                    textStyle: FontConst.regular.copyWith(
                        fontSize: 14)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
