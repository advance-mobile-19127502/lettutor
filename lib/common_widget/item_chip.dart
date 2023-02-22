

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';

class ItemChip extends StatelessWidget {
  const ItemChip({Key? key, required this.content}) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        content,
        style: GoogleFonts.roboto(
            textStyle: FontConst.regular
                .copyWith(color: Colors.blue, fontSize: 12)),
      ),
      backgroundColor: ColorConst.selectedChipColor,
    );
  }
}
