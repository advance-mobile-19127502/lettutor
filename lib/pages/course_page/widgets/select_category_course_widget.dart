import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/list_course_bloc/list_course_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/common_widget/multi_select_map_key_value.dart';

class SelectCategoryCourseWidget extends StatefulWidget {
  const SelectCategoryCourseWidget({Key? key}) : super(key: key);

  @override
  State<SelectCategoryCourseWidget> createState() =>
      _SelectCategoryCourseWidgetState();
}

class _SelectCategoryCourseWidgetState
    extends State<SelectCategoryCourseWidget> {
  bool isForcus = false;
  Map<String, String> selectedCategory = {};
  late ListCourseBloc listCourseBloc;
  Map<String, String> categoryOptions = {};

  @override
  void initState() {
    super.initState();
    listCourseBloc = BlocProvider.of<ListCourseBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListCourseBloc, ListCourseState>(
      bloc: listCourseBloc,
      listener: (context, state) {
        if (state is ListCourseSuccess) {
          for (var element in listCourseBloc.listCategory) {
            categoryOptions[element.title!] = element.id!;
          }
        }
      },
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
                        selectedCategory.isEmpty
                            ? AppLocalizations.of(context)!.selectCategory
                            : "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Wrap(
                        spacing: 4,
                        children: selectedCategory.entries
                            .map((e) => Chip(
                                  label: Text(e.key,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14)),
                                  onDeleted: () {
                                    selectedCategory.remove(e.key);
                                    listCourseBloc.add(OnFilterListCourseEvent(
                                        null, null, selectedCategory, null));
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
            items: categoryOptions,
            title: "Select tutor nationality",
            selectedItems: selectedCategory,
            isMultiSelect: true,
          );
        });
    if (tempSelected != null) {
      selectedCategory = tempSelected.cast();
      isForcus = false;
      listCourseBloc
          .add(OnFilterListCourseEvent(null, null, selectedCategory, null));
    } else {
      setState(() {
        isForcus = false;
      });
    }
  }
}
