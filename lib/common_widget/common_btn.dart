import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget(
      {Key? key, required this.title, this.icon, required this.onPress})
      : super(key: key);

  final String title;
  final IconData? icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? ElevatedButton(
            onPressed: onPress,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
                ),
                side: const BorderSide(
                  color: Colors.blue,
                )),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular
                      .copyWith(fontSize: 14, color: Colors.blue)),
            ),
          )
        : ElevatedButton.icon(
            onPressed: onPress,
            icon: Icon(icon, color: Colors.blue,),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
                ),
                side: const BorderSide(
                  color: Colors.blue,
                )),
            label: Text(
              title,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular
                      .copyWith(fontSize: 14, color: Colors.blue)),
            ));
  }
}
