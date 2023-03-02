import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class HeaderDialog extends StatelessWidget {
  const HeaderDialog({Key? key, required this.headerTitle}) : super(key: key);

  final String headerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ))),
      child: Padding(
        padding: const EdgeInsets.only(
          left: StyleConst.kDefaultPadding,
          right: StyleConst.kDefaultPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              headerTitle,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.semiBold.copyWith(fontSize: 18)),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.cancel),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
