

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class AvaNameMailRowWidget extends StatelessWidget {
  const AvaNameMailRowWidget({Key? key, required this.avaUrl, required this.name, required this.email}) : super(key: key);

  final String avaUrl, name, email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(avaUrl),
          radius: 45,
        ),
        const SizedBox(
          width: StyleConst.kDefaultPadding,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.medium.copyWith(fontSize: 15)),
            ),
            Text(
              email,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular.copyWith(
                      fontSize: 12, color: ColorConst.greyTextColor)),
            )
          ],
        )
      ],
    );
  }
}
