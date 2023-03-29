import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/data/choice_list.dart';

class ListChipWidget extends StatefulWidget {
  const ListChipWidget({Key? key}) : super(key: key);

  @override
  State<ListChipWidget> createState() => _ListChipWidgetState();
}

class _ListChipWidgetState extends State<ListChipWidget> {
  late ListTutorBloc listTutorBloc;

  int? _selectedIndex = 0;

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
          _selectedIndex = 0;
        }
      },
      builder: (context, state) {
        return Wrap(
          spacing: 5,
          children: List<Widget>.generate(choicesListExample.length, (index) {
            MapEntry<dynamic, dynamic> tempValue =
                choicesListExample.entries.toList()[index];
            return ChoiceChip(
              label: Text(tempValue.key),
              labelStyle: GoogleFonts.roboto(
                  textStyle: FontConst.regular.copyWith(
                      color:
                          _selectedIndex == index ? Colors.blue : Colors.black,
                      fontSize: 12)),
              backgroundColor: ColorConst.unselectedChipColor,
              selectedColor: ColorConst.selectedChipColor,
              elevation: 0,
              selected: _selectedIndex == index,
              onSelected: (bool selected) {
                _selectedIndex = index;
                listTutorBloc.add(OnFilterListTutorEvent(
                    listTutorBloc.tutorName,
                    listTutorBloc.filters.nationality,
                    tempValue.value));
              },
            );
          }).toList(),
        );
      },
    );
  }
}
