import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/course_page/widgets/discovery_search_row.dart';
import 'package:lettutor/pages/course_page/widgets/filters_widget.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Discovery courses and search
            DiscoverySeachRow(),

            //Description
            SizedBox(height: StyleConst.kDefaultPadding,),

            Text(
              "LiveTutor has built the most quality, methodical and scientific courses"
              " in the fields of life for those who are in need of improving their knowledge"
              " of the fields.",
              style: GoogleFonts.openSans(
                  textStyle: FontConst.regular.copyWith(fontSize: 14)),
            ),

            SizedBox(height: StyleConst.kDefaultPadding,),

            FiltersWidget()

          ],
        ),
      ),
    );
  }
}
