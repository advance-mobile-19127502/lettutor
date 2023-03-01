import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/alert_container.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/text_form_field_become_a_tutor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CVColumn extends StatefulWidget {
  const CVColumn({Key? key}) : super(key: key);

  @override
  State<CVColumn> createState() => _CVColumnState();
}

class _CVColumnState extends State<CVColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.studentWillView,
          style: GoogleFonts.openSans(
              textStyle: FontConst.regular.copyWith(fontSize: 14)),
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        AlertContainer(
            alertContent: AppLocalizations.of(context)!.inOrderToProtect),
        TextFormFieldBecomeATutor(
          title: AppLocalizations.of(context)!.interest,
          hintTitle: AppLocalizations.of(context)!.hintInterests,
        ),
        TextFormFieldBecomeATutor(
          title: AppLocalizations.of(context)!.education,
          hintTitle: AppLocalizations.of(context)!.hintEducation,
        ),
        TextFormFieldBecomeATutor(
          title: AppLocalizations.of(context)!.experience,
          hintTitle: '',
        ),
        TextFormFieldBecomeATutor(
          title: AppLocalizations.of(context)!.currentPrevProfession,
          hintTitle: '',
        ),
      ],
    );
  }
}
