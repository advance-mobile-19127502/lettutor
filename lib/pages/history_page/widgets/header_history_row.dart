import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';

class HeaderHistoryRow extends StatelessWidget {
  const HeaderHistoryRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/history.svg",
          width: 100,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "History",
                style: GoogleFonts.poppins(
                    textStyle: FontConst.semiBold.copyWith(fontSize: 30)),
              ),
              Text(
                "The following is a list of lessons you have attended\n"
                "You can review the details of the lessons you have attended",
                style: GoogleFonts.roboto(
                    textStyle: FontConst.regular.copyWith(
                        fontSize: 18, color: ColorConst.greyTextColor)),
              )
            ],
          ),
        )
      ],
    );
  }
}
