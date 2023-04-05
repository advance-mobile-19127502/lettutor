import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/become_tutor_bloc/become_tutor_bloc.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseWhoRadioWidget extends StatefulWidget {
  const ChooseWhoRadioWidget({Key? key}) : super(key: key);

  @override
  State<ChooseWhoRadioWidget> createState() => _ChooseWhoRadioWidgetState();
}

class _ChooseWhoRadioWidgetState extends State<ChooseWhoRadioWidget> {
  String selectedTeching = "Beginner";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.bestAtTeachingWho,
              style: GoogleFonts.openSans(
                  textStyle: FontConst.regular.copyWith(fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                    value: 'Beginner',
                    groupValue: selectedTeching,
                    onChanged: (value) {
                      checkRadio(value!);
                    }),
                Text(
                  AppLocalizations.of(context)!.beginner,
                  style: GoogleFonts.openSans(
                      textStyle: FontConst.regular.copyWith(fontSize: 14)),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                    value: 'Intermediate',
                    groupValue: selectedTeching,
                    onChanged: (value) {
                      checkRadio(value!);
                    }),
                Text(
                  AppLocalizations.of(context)!.intermediate,
                  style: GoogleFonts.openSans(
                      textStyle: FontConst.regular.copyWith(fontSize: 14)),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                    value: 'Advanced',
                    groupValue: selectedTeching,
                    onChanged: (value) {
                      checkRadio(value!);
                    }),
                Text(
                  AppLocalizations.of(context)!.advanced,
                  style: GoogleFonts.openSans(
                      textStyle: FontConst.regular.copyWith(fontSize: 14)),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  void checkRadio(String value) {
    setState(() {
      selectedTeching = value;
      BlocProvider.of<BecomeTutorBloc>(context).targetStudent = selectedTeching;
    });
  }
}
