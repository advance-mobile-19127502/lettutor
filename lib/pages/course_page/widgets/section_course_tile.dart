import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/section_course.dart';
import 'package:lettutor/pages/course_page/widgets/course_tile.dart';

class SectionCourseTile extends StatelessWidget {
  final SectionCourse sectionCourse;

  const SectionCourseTile({Key? key, required this.sectionCourse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        Text(
          sectionCourse.sectionTitle,
          style: GoogleFonts.poppins(
              textStyle: FontConst.medium.copyWith(fontSize: 28)),
        ),
        Wrap(
          spacing: StyleConst.kDefaultPadding,
          runSpacing: StyleConst.kDefaultPadding / 3,
          children: sectionCourse.listCourses
              .map((e) => Column(
                    children: [
                      const SizedBox(
                        height: StyleConst.kDefaultPadding / 3,
                      ),
                      CourseTile(course: e),
                      const SizedBox(
                        height: StyleConst.kDefaultPadding / 2,
                      ),
                    ],
                  ))
              .toList(),
        )
      ],
    );
  }
}
