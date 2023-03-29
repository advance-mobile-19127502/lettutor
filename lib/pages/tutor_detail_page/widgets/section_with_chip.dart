import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_widget/item_chip.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class SectionWithChipWidget extends StatelessWidget {
  const SectionWithChipWidget(
      {Key? key, required this.title, required this.listChip})
      : super(key: key);
  final String title;
  final List<String> listChip;

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
        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),
        Padding(
          padding: const EdgeInsets.only(left: StyleConst.kDefaultPadding),
          child: Wrap(
            children: List<Widget>.generate(listChip.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ItemChip(content: listChip[index]),
              );
            }),
          ),
        )
      ],
    );
  }
}
