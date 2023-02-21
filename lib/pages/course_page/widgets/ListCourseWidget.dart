import 'package:flutter/material.dart';
import 'package:lettutor/data/section_course_list.dart';
import 'package:lettutor/pages/course_page/widgets/section_course_tile.dart';

class ListCourseWidget extends StatefulWidget {
  const ListCourseWidget({Key? key}) : super(key: key);

  @override
  State<ListCourseWidget> createState() => _ListCourseWidgetState();
}

class _ListCourseWidgetState extends State<ListCourseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: listSectionCourse
          .map((e) => SectionCourseTile(sectionCourse: e))
          .toList(),
    );
  }
}
