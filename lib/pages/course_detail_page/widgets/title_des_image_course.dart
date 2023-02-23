

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class TiltleDesImageWidget extends StatelessWidget {
  const TiltleDesImageWidget({Key? key, required this.imageUrl, required this.title, required this.description}) : super(key: key);

  final String imageUrl, title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(StyleConst.defaultRadius),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.black26,
            ),
          ]),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(StyleConst.defaultRadius),
                  topLeft: Radius.circular(StyleConst.defaultRadius)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      textStyle:
                      FontConst.semiBold.copyWith(fontSize: 16)),
                ),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                      textStyle: FontConst.medium.copyWith(
                          fontSize: 12, color: ColorConst.greyTextColor)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
