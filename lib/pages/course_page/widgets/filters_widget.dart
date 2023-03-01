import 'package:flutter/material.dart';
import 'package:lettutor/common_widget/drop_select_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FiltersWidget extends StatelessWidget {
  FiltersWidget({Key? key}) : super(key: key);

  final List<String> levelOption = [
    "Any level",
    "Beginer",
    "Upper-Beginer",
    "Pre-Intermediate",
    "Intermediate",
    "Upper-Intermediate",
    "Pre-Advanced",
    "Advanced",
    "Very Advanced",
  ];

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

  final List<String> sortOption = [
    "Level Ascending",
    "Level Decending"
  ];

  final List<String> selectedSort = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        DropDownSelectMenuItem(
            optionsList: levelOption,
            selectedList: selectedLevel,
            hintTitle: AppLocalizations.of(context)!.selectLevel),

        DropDownSelectMenuItem(
            optionsList: categoryOption,
            selectedList: selectedCategory,
            hintTitle: AppLocalizations.of(context)!.selectCategory),

        DropDownSelectMenuItem(
            optionsList: sortOption,
            selectedList: selectedSort,
            hintTitle: AppLocalizations.of(context)!.sortLevel),
      ],
    );
  }
}
