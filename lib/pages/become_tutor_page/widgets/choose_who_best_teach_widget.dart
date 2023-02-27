

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';


class ChooseWhoRadioWidget extends StatefulWidget {
  const ChooseWhoRadioWidget({Key? key}) : super(key: key);

  @override
  State<ChooseWhoRadioWidget> createState() => _ChooseWhoRadioWidgetState();
}

class _ChooseWhoRadioWidgetState extends State<ChooseWhoRadioWidget> {

  String selectedTeching = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "I am best at teaching students who are",
              style: GoogleFonts.openSans(
                  textStyle: FontConst.regular.copyWith(fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                    value: 'Beginner',
                    groupValue: selectedTeching,
                    onChanged: (value) {
                      checkRadio(value!);
                    }),
                Text(
                  'Beginner',
                  style: GoogleFonts.openSans(
                      textStyle: FontConst.regular.copyWith(fontSize: 14)),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                    value: 'Intermediate',
                    groupValue: selectedTeching,
                    onChanged: (value) {
                      checkRadio(value!);
                    }),
                Text(
                  'Intermediate',
                  style: GoogleFonts.openSans(
                      textStyle: FontConst.regular.copyWith(fontSize: 14)),
                ),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                    value: 'Advanced',
                    groupValue: selectedTeching,
                    onChanged: (value) {
                      checkRadio(value!);
                    }),
                Text(
                  'Advanced',
                  style: GoogleFonts.openSans(
                      textStyle: FontConst.regular.copyWith(fontSize: 14)),
                ),
              ],
            ),


          ],
        )
      ],
    );
  }

  void checkRadio(String value) {
    setState(() {
      selectedTeching = value;
    });
  }
}
