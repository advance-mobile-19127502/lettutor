import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/alert_container.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/text_form_field_become_a_tutor.dart';

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
          "Students will view this information on your profile to decide if you're a good fit for them.",
          style: GoogleFonts.openSans(
              textStyle: FontConst.regular.copyWith(fontSize: 14)),
        ),

        const SizedBox(height: StyleConst.kDefaultPadding,),

        const AlertContainer(
            alertContent:
                "In order to protect your privacy, please do not share your"
                    " personal information (email, phone number, social email, skype, etc)"
                    " in your profile."),

        const TextFormFieldBecomeATutor(title: 'Interests', hintTitle: "Interests, hobbies, memorable life experiences, or anything else you'd like to share!",),

        const TextFormFieldBecomeATutor(title: 'Education', hintTitle: "Example: \"Bachelor of Arts in English from Cambly University; Certified yoga instructor, Second Language Acquisition and Teaching  (SLAT) certificate from Cambly University",),

        const TextFormFieldBecomeATutor(title: 'Experience', hintTitle: '',),

        const TextFormFieldBecomeATutor(title: 'Current or Previous Profession', hintTitle: '',),


      ],
    );
  }
}
