import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/style_const.dart';

import '../../../constants/font_const.dart';

class AlertContainer extends StatelessWidget {
  AlertContainer({Key? key, required this.alertContent, this.noteContent})
      : super(key: key);

  final String alertContent;
  String? noteContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue), color: Colors.blue[100]),
      padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: alertContent,
            style: GoogleFonts.roboto(
                textStyle: FontConst.regular
                    .copyWith(fontSize: 14, color: Colors.black)),
          ),
          noteContent != null
              ? TextSpan(
                  text: noteContent,
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.regular
                          .copyWith(fontSize: 14, color: Colors.red)),
                )
              : const TextSpan(),
        ]),
      ),
    );
  }
}
