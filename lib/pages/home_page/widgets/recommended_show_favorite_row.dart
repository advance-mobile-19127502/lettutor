import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';

class RecommendedAndShowFavoriteRow extends StatelessWidget {
  const RecommendedAndShowFavoriteRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Recommended Tutors",
          style: GoogleFonts.roboto(
              textStyle: FontConst.bold.copyWith(fontSize: 25)),
        ),
      ],
    );
  }
}
