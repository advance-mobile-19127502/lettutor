import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/data/choice_list.dart';

class ListChipWidget extends StatefulWidget {
  const ListChipWidget({Key? key}) : super(key: key);

  @override
  State<ListChipWidget> createState() => _ListChipWidgetState();
}

class _ListChipWidgetState extends State<ListChipWidget> {
  int? _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: List<Widget>.generate(choicesListExample.length, (index) {
        return ChoiceChip(
          label: Text(choicesListExample[index]),
          labelStyle: GoogleFonts.roboto(textStyle: FontConst.regular.copyWith(
            color: _selectedIndex == index ? Colors.blue : Colors.black,
            fontSize: 12
          )),
          backgroundColor: ColorConst.unselectedChipColor,
          selectedColor: ColorConst.selectedChipColor,
          elevation: 0,
          selected: _selectedIndex == index,
          onSelected: (bool selected) {
            setState(() {
              _selectedIndex = index;
            });
          },);
      }).toList(),
    );
  }
}
