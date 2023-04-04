import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/course_page/widgets/list_course_widget.dart';
import 'package:lettutor/pages/course_page/widgets/discovery_search_row.dart';
import 'package:lettutor/pages/course_page/widgets/filters_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            const DiscoverySeachRow(),

            //Description
            const SizedBox(
              height: StyleConst.kDefaultPadding,
            ),

            Text(
              AppLocalizations.of(context)!.liveTutorHasBuilt,
              style: GoogleFonts.openSans(
                  textStyle: FontConst.regular.copyWith(fontSize: 14)),
            ),

            const SizedBox(
              height: StyleConst.kDefaultPadding,
            ),

            FiltersWidget(),

            //List course

            const ListCourseWidget(),
          ],
        ),
      ),
    );
  }
}
