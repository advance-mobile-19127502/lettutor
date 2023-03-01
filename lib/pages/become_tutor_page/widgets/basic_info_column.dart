import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/alert_container.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/text_form_field_become_a_tutor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasicInfoColumn extends StatefulWidget {
  const BasicInfoColumn({Key? key}) : super(key: key);

  @override
  State<BasicInfoColumn> createState() => _BasicInfoColumnState();
}

class _BasicInfoColumnState extends State<BasicInfoColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 50,
        ),

        SizedBox(height: StyleConst.kDefaultPadding,),

        AlertContainer(alertContent: AppLocalizations.of(context)!.plsUpProPhoto),

        TextFormFieldBecomeATutor(title: AppLocalizations.of(context)!.tutoringName, hintTitle: '',),

        TextFormFieldBecomeATutor(title: AppLocalizations.of(context)!.imFrom, hintTitle: '',),

        TextFormFieldBecomeATutor(title: AppLocalizations.of(context)!.dob, hintTitle: '',),


      ],
    );
  }
}
