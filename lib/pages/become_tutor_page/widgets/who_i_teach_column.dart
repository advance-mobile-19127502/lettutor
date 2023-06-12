import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/become_tutor_bloc/become_tutor_bloc.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/choice_list.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/alert_container.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/choose_who_best_teach_widget.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/text_form_field_become_a_tutor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            alertContent: AppLocalizations.of(context)!.firstThingStudentLook),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        TextFormFieldBecomeATutor(
          title: AppLocalizations.of(context)!.introduction,
          hintTitle: AppLocalizations.of(context)!.hintIntroduction,
          onTextChanged: (value) {
            BlocProvider.of<BecomeTutorBloc>(context).introduction = value;
          },
        ),
        const ChooseWhoRadioWidget(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.mySpecialties,
              style: GoogleFonts.openSans(
                  textStyle: FontConst.regular.copyWith(fontSize: 14)),
            ),
            Expanded(
                child: ListBody(
              children:
                  List<Widget>.generate(choicesListExample.length, (index) {
                String tempValue =
                    choicesListExample.entries.toList()[index].key;
                return CheckboxListTile(
                    dense: true,
                    visualDensity:
                        const VisualDensity(horizontal: -4.0, vertical: -4.0),
                    contentPadding: EdgeInsets.zero,
                    value: selectedSpecialitis.contains(tempValue),
                    title: Text(
                      tempValue,
                      style: GoogleFonts.openSans(
                          textStyle: FontConst.regular.copyWith(fontSize: 14)),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) =>
                        _itemChange(tempValue, isChecked!));
              }),
            )),
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
    BlocProvider.of<BecomeTutorBloc>(context).specialities =
        selectedSpecialitis.join(",");
  }
}
