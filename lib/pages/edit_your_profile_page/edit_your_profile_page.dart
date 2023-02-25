import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/my_profile.dart';
import 'package:lettutor/pages/edit_your_profile_page/widgets/form_field_widget.dart';

class EditYourProfilePage extends StatelessWidget {
  const EditYourProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(myProfile.avaUrl),
                        child: const Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                 FormFieldWidget(
                    title: "Name",
                    hintTitle: myProfile.name,
                    isEnabled: true),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),


                FormFieldWidget(
                    title: "Email address",
                    hintTitle: myProfile.email,
                    isEnabled: false),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                FormFieldWidget(
                    title: "Country",
                    hintTitle: myProfile.country,
                    isEnabled: true),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                FormFieldWidget(
                    title: "Phone numver",
                    hintTitle: myProfile.phoneNumber,
                    isEnabled: true),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                FormFieldWidget(
                    title: "Birthday",
                    hintTitle: myProfile.dateOfBirth.toString(),
                    isEnabled: true),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                FormFieldWidget(
                    title: "My level",
                    hintTitle: myProfile.myLevel,
                    isEnabled: true),

                 const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                FormFieldWidget(
                    title: "Want to learn",
                    hintTitle: myProfile.wantToLearn,
                    isEnabled: true),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                FormFieldWidget(
                    title: "Study schedule",
                    hintTitle: myProfile.studySchedule,
                    isEnabled: true),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
