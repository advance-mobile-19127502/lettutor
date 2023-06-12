import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/list_course_bloc/list_course_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/common_widget/multi_select_map_key_value.dart';

class SelectSortLevel extends StatefulWidget {
  const SelectSortLevel({Key? key}) : super(key: key);

  @override
  State<SelectSortLevel> createState() => _SelectSortLevelState();
}

class _SelectSortLevelState extends State<SelectSortLevel> {
  bool isForcus = false;
  Map<String, String> selectedSortLevel = {};
  late ListCourseBloc listCourseBloc;
  Map<String, String> sortLevelOptions = {
    "Level ascending": "ASC",
    "Level decreasing": "DESC"
  };

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
          onTap: state is ListCourseLoading
              ? null
              : () {
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
                        selectedSortLevel.isEmpty
                            ? AppLocalizations.of(context)!.sortLevel
                            : "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Wrap(
                        spacing: 4,
                        children: selectedSortLevel.entries
                            .map((e) => Chip(
                                  label: Text(e.key,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14)),
                                  onDeleted: () {
                                    selectedSortLevel.remove(e.key);
                                    setState(() {});
                                    listCourseBloc.add(OnFilterListCourseEvent(
                                        null, null, null, selectedSortLevel));
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
            items: sortLevelOptions,
            title: "Select tutor nationality",
            selectedItems: selectedSortLevel,
            isMultiSelect: false,
          );
        });
    if (tempSelected != null) {
      selectedSortLevel = tempSelected.cast();
      isForcus = false;
      listCourseBloc
          .add(OnFilterListCourseEvent(null, null, null, selectedSortLevel));
    } else {
      setState(() {
        isForcus = false;
      });
    }
  }
}
