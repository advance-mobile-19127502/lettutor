

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class SectionWithDescriptionWidget extends StatelessWidget {
  const SectionWithDescriptionWidget({Key? key, required this.sectionTitle, required this.description}) : super(key: key);

  final String sectionTitle, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.question_mark,
              color: Colors.red,
              size: 16,
            ),
            Text(
              sectionTitle,
              style: GoogleFonts.poppins(
                  textStyle: FontConst.medium.copyWith(fontSize: 16)),
            ),
          ],
        ),
        Padding(
          padding:
          const EdgeInsets.only(left: StyleConst.kDefaultPadding),
          child: Text(
            description,
            style: GoogleFonts.openSans(
                textStyle: FontConst.regular.copyWith(fontSize: 14)),
          ),
        )
      ],
    );
  }
}
