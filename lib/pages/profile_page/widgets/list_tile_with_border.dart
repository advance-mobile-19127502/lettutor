import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class ListTileWithBorder extends StatelessWidget {
  const ListTileWithBorder(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress})
      : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: StyleConst.kDefaultPadding),
      child: Container(
        padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.black26,
              ),
            ]),
        child: InkWell(
          onTap: onPress,
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: StyleConst.kDefaultPadding / 2,
              ),
              Text(
                title,
                style: GoogleFonts.roboto(
                    textStyle: FontConst.medium.copyWith(fontSize: 15)),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
