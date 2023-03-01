

import 'package:flutter/material.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/home_page/widgets/text_form_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TutorNameRow extends StatelessWidget {
  const TutorNameRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        TextFormWidget(hintTitle: AppLocalizations.of(context)!.enterTutorName, widthSize: screenSize.width / 2.5,),
        const SizedBox(
          width: StyleConst.kDefaultPadding,
        ),
        TextFormWidget(hintTitle: AppLocalizations.of(context)!.selectTutorNation, widthSize: screenSize.width / 2.5,icon: Icons.keyboard_arrow_down_sharp,),
      ],
    );
  }
}
