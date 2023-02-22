import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class SectionWithTextWidget extends StatelessWidget {
  const SectionWithTextWidget(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              textStyle: FontConst.medium.copyWith(fontSize: 17)),
        ),

        const SizedBox(height: StyleConst.kDefaultPadding / 3,),

        Padding(
          padding: const EdgeInsets.only(left: StyleConst.kDefaultPadding),
          child: Text(
            description,
            style: GoogleFonts.poppins(
                textStyle: FontConst.regular
                    .copyWith(fontSize: 14, color: ColorConst.greyTextColor)),
          ),
        )
      ],
    );
  }
}
