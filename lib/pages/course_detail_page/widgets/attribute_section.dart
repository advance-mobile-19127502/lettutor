import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/course_detail_page/widgets/section_widget.dart';

class AttributeSection extends StatelessWidget {
  const AttributeSection({Key? key, required this.sectionTitle, required this.attribute, required this.icon}) : super(key: key);

  final String sectionTitle, attribute;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidget(sectionTitle: sectionTitle),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        Row(
          children: [
            Icon(
              icon,
              color: Colors.blue,
            ),
            const SizedBox(
              width: StyleConst.kDefaultPadding / 4,
            ),
            Text(
              attribute,
              style: GoogleFonts.poppins(
                  textStyle: FontConst.medium.copyWith(fontSize: 16)),
            )
          ],
        )
      ],
    );
  }
}
