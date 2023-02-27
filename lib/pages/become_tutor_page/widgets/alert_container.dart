

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/style_const.dart';

import '../../../constants/font_const.dart';

class AlertContainer extends StatelessWidget {
  const AlertContainer({Key? key, required this.alertContent}) : super(key: key);

  final String alertContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue), color: Colors.blue[100]),
      padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
      child: Text(
        alertContent,
        style: GoogleFonts.roboto(
            textStyle: FontConst.regular.copyWith(fontSize: 14)),
      ),
    );
  }
}
