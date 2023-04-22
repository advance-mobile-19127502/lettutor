import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/list_course_bloc/list_course_bloc.dart';
import 'package:lettutor/common_widget/multi_select_map_key_value.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/level_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectLevelCourseWidget extends StatefulWidget {
  const SelectLevelCourseWidget({Key? key}) : super(key: key);

  @override
  State<SelectLevelCourseWidget> createState() =>
      _SelectLevelCourseWidgetState();
}

class _SelectLevelCourseWidgetState extends State<SelectLevelCourseWidget> {
  bool isForcus = false;
  Map<String, int> selectedLevel = {};
  late ListCourseBloc listCourseBloc;

  @override
  void initState() {
    super.initState();
    listCourseBloc = BlocProvider.of<ListCourseBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCourseBloc, ListCourseState>(
      bloc: listCourseBloc,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            _showMultiSelectKeyValue();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                border: Border.all(
                    width: isForcus ? 2 : 1,
                    color: isForcus
                        ? Theme.of(context).primaryColor
                        : Colors.grey),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Text(
                        selectedLevel.isEmpty
                            ? AppLocalizations.of(context)!.selectLevel
                            : "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Wrap(
                        spacing: 4,
                        children: selectedLevel.entries
                            .map((e) => Chip(
                                  label: Text(e.key,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14)),
                                  onDeleted: () {
                                    selectedLevel.remove(e.key);
                                    listCourseBloc.add(OnFilterListCourseEvent(
                                        null, selectedLevel));
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: null,
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: isForcus
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      size: 14,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMultiSelectKeyValue() async {
    setState(() {
      isForcus = true;
    });
    Map<String, dynamic>? tempSelected = await showDialog(
        context: context,
        builder: (context) {
          return MultiSelectMapKeyValue(
              items: levelOptionKeyValue,
              title: "Select tutor nationality",
              selectedItems: selectedLevel);
        });
    if (tempSelected != null) {
      selectedLevel = tempSelected.cast();
      isForcus = false;
      listCourseBloc.add(OnFilterListCourseEvent(null, selectedLevel));
    } else {
      setState(() {
        isForcus = false;
      });
    }
  }
}
