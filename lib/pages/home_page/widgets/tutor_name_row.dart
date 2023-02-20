

import 'package:flutter/material.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/home_page/widgets/text_form_widget.dart';

class TutorNameRow extends StatelessWidget {
  const TutorNameRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        TextFormWidget(hintTitle: "Enter tutor name", widthSize: screenSize.width / 2.5,),
        SizedBox(
          width: StyleConst.kDefaultPadding,
        ),
        TextFormWidget(hintTitle: "Select tutor nation", widthSize: screenSize.width / 2.5,icon: Icons.keyboard_arrow_down_sharp,),
      ],
    );
  }
}
