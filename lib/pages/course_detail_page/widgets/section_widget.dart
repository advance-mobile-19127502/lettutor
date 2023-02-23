

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({Key? key, required this.sectionTitle}) : super(key: key);

  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: StyleConst.kDefaultPadding,
        ),
        Text(
          sectionTitle,
          style: GoogleFonts.roboto(
              textStyle: FontConst.bold.copyWith(fontSize: 22)),
        ),
        const Expanded(
            child: Divider(
              thickness: 1,
            ))
      ],
    );
  }
}
