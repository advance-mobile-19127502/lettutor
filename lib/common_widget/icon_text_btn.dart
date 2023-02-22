

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/font_const.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({Key? key, required this.title, required this.icon, required this.onPress}) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          Text(
            title,
            style: GoogleFonts.roboto(
                textStyle: FontConst.medium.copyWith(
                    fontSize: 13,
                    color: Colors.blue)),
          )
        ],
      ),
    );
  }
}
