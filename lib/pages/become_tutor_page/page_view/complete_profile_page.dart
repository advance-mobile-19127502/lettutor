import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/ava_set_up_widget.dart';
import 'package:lettutor/common_widget/section_widget.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/basic_info_column.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/cv_column.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/text_form_field_become_a_tutor.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/who_i_teach_column.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/section_with_text.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AvaSetUpWidget(),
        SizedBox(
          height: StyleConst.kDefaultPadding,
        ),

        SectionWidget(sectionTitle: "Basic info  ", fontSize: 16,),

        BasicInfoColumn(),

        SectionWidget(sectionTitle: "CV  ", fontSize: 16,),

        SizedBox(
          height: StyleConst.kDefaultPadding,
        ),

        CVColumn(),

        SectionWidget(sectionTitle: "Languages I speak  ", fontSize: 16,),

        SizedBox(
          height: StyleConst.kDefaultPadding,
        ),

        TextFormFieldBecomeATutor(title: 'Languages', hintTitle: '',),

        SectionWidget(sectionTitle: "Who I teach  ", fontSize: 16,),

        SizedBox(
          height: StyleConst.kDefaultPadding,
        ),

        WhoITeachColumn(),


      ],
    );
  }
}
