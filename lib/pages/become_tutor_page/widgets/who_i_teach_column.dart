import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/choice_list.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/alert_container.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/choose_who_best_teach_widget.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/text_form_field_become_a_tutor.dart';

class WhoITeachColumn extends StatefulWidget {
  const WhoITeachColumn({Key? key}) : super(key: key);

  @override
  State<WhoITeachColumn> createState() => _WhoITeachColumnState();
}

class _WhoITeachColumnState extends State<WhoITeachColumn> {
  List<String> selectedSpecialitis = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AlertContainer(
            alertContent:
                "This is the first thing students will see when looking for tutors."),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        const TextFormFieldBecomeATutor(
            title: "Introduction",
            hintTitle:
                "Example: \"I was a doctor for 35 years and can help you practice business or medical English."
                " I also enjoy teaching beginners as I am very patient and always speak slowly and clearly. "),
        const ChooseWhoRadioWidget(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My specialties are",
              style: GoogleFonts.openSans(
                  textStyle: FontConst.regular.copyWith(fontSize: 14)),
            ),
            Expanded(
              child: ListBody(
                children: choicesListExample
                    .map((value) => CheckboxListTile(
                        dense: true,
                        visualDensity: const VisualDensity(
                            horizontal: -4.0, vertical: -4.0),
                        contentPadding: EdgeInsets.zero,
                        value: selectedSpecialitis.contains(value),
                        title: Text(
                          value,
                          style: GoogleFonts.openSans(
                              textStyle:
                                  FontConst.regular.copyWith(fontSize: 14)),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (isChecked) =>
                            _itemChange(value, isChecked!)))
                    .toList(),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedSpecialitis.add(itemValue);
      } else {
        selectedSpecialitis.remove(itemValue);
      }
    });
  }
}
