import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/common_widget/multi_select.dart';
import 'package:lettutor/models/from_api/filters.dart';

class SelectNationalityWidget extends StatefulWidget {
  const SelectNationalityWidget({Key? key}) : super(key: key);

  @override
  State<SelectNationalityWidget> createState() =>
      _SelectNationalityWidgetState();
}

class _SelectNationalityWidgetState extends State<SelectNationalityWidget> {
  late ListTutorBloc listTutorBloc;
  final List<String> nationalityOption = [
    "Foreign Tutor",
    "Vietnamese Tutor",
    "Native Tutor"
  ];

  List<String> selectedNationality = [];
  bool isForcus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTutorBloc = BlocProvider.of<ListTutorBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListTutorBloc, ListTutorState>(
      listener: (context, state) {
        if (state is ListTutorResetFilter) {
          selectedNationality = [];
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            _showMultiSelect();
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
                        selectedNationality.isEmpty
                            ? "Select your nationality"
                            : "",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Wrap(
                        spacing: 4,
                        children: selectedNationality
                            .map((e) => Chip(
                                  label: Text(e,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14)),
                                  onDeleted: () {
                                    selectedNationality.remove(e);
                                    checkNationality();
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

  void _showMultiSelect() async {
    setState(() {
      isForcus = true;
    });
    List<String>? tempSelected = await showDialog(
        context: context,
        builder: (context) {
          return MultiSelect(
              items: nationalityOption,
              title: "Select tutor nationality",
              selectedItems: selectedNationality);
        });
    if (tempSelected != null) {
      selectedNationality = tempSelected;
      isForcus = false;
      checkNationality();
    } else {
      setState(() {
        isForcus = false;
      });
    }
  }

  void checkNationality() {
    if (selectedNationality.contains("Foreign Tutor")) {
      listTutorBloc.add(OnFilterListTutorEvent(listTutorBloc.tutorName,
          Nationality(isNative: false, isVietNamese: false), null));
    } else {
      listTutorBloc.add(OnFilterListTutorEvent(
          listTutorBloc.tutorName,
          Nationality(
            isNative:
                selectedNationality.contains("Native Tutor") ? true : null,
            isVietNamese:
                selectedNationality.contains("Vietnamese Tutor") ? true : null,
          ),
          null));
    }
  }
}
