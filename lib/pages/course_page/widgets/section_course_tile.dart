import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/from_api/categories_course.dart';
import 'package:lettutor/models/from_api/course_info.dart';
import 'package:lettutor/models/section_course.dart';
import 'package:lettutor/pages/course_page/widgets/course_tile.dart';

class SectionCourseTile extends StatelessWidget {
  final Categories sectionCategory;
  final List<CourseInfo> listCourseCategory;

  const SectionCourseTile(
      {Key? key,
      required this.sectionCategory,
      required this.listCourseCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        Text(
          sectionCategory.title ?? "",
          style: GoogleFonts.poppins(
              textStyle: FontConst.medium.copyWith(fontSize: 28)),
        ),
        Wrap(
          spacing: StyleConst.kDefaultPadding,
          runSpacing: StyleConst.kDefaultPadding / 3,
          children: listCourseCategory
              .map((e) => Column(
                    children: [
                      const SizedBox(
                        height: StyleConst.kDefaultPadding / 3,
                      ),
                      CourseTile(courseInfo: e),
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
