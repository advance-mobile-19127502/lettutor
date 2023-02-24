import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/my_profile.dart';
import 'package:lettutor/pages/profile_page/widgets/ava_name_mail_row.dart';
import 'package:lettutor/pages/profile_page/widgets/list_tile_with_border.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
        child: Column(
          children: [
            AvaNameMailRowWidget(
                avaUrl: myProfile.avaUrl,
                name: myProfile.name,
                email: myProfile.email),
            const SizedBox(height: StyleConst.kDefaultPadding),
            const Divider(
              thickness: 2,
            ),
            ListTileWithBorder(
                title: "Your profile", icon: Icons.person, onPress: () {}),
            ListTileWithBorder(
                title: "History", icon: Icons.history, onPress: () {}),
            ListTileWithBorder(
                title: "Become a tutor", icon: Icons.grading, onPress: () {}),
            ListTileWithBorder(
                title: "Settings", icon: Icons.settings, onPress: () {}),
            const SizedBox(height: StyleConst.kDefaultPadding * 2),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                StyleConst.defaultRadius))),
                    onPressed: () {},
                    child: const Text("LOG OUT")))
          ],
        ),
      ),
    );
  }
}
