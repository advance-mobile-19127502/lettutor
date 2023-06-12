import 'package:flutter/material.dart';
import 'package:lettutor/common_widget/drop_select_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/data/level_options.dart';
import 'package:lettutor/pages/course_page/widgets/select_category_course_widget.dart';
import 'package:lettutor/pages/course_page/widgets/select_level_course_widget.dart';
import 'package:lettutor/pages/course_page/widgets/select_sort_level_widget.dart';

class FiltersWidget extends StatelessWidget {
  FiltersWidget({Key? key}) : super(key: key);

  final List<String> selectedLevel = [];

  final List<String> categoryOption = [
    "English For Kids",
    "English For Adults",
    "English For Business",
    "English For Travelling",
    "English For Work",
    "Ielts",
    "TOEIC",
  ];

  final List<String> selectedCategory = [];

  final List<String> sortOption = ["Level Ascending", "Level Decending"];

  final List<String> selectedSort = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 15,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 2.25,
            child: const SelectLevelCourseWidget()),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2.25,
            child: const SelectCategoryCourseWidget()),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2.25,
            child: const SelectSortLevel()),
      ],
    );
  }
}
