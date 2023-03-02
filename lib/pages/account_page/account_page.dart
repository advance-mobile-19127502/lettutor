import 'package:flutter/material.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/my_profile.dart';
import 'package:lettutor/pages/account_page/widgets/ava_name_mail_row.dart';
import 'package:lettutor/pages/account_page/widgets/list_tile_with_border.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

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
                title: AppLocalizations.of(context)!.editProfile,
                icon: Icons.person,
                onPress: () {
                  Navigator.of(context).pushNamed("/edit-your-profile");
                }),
            ListTileWithBorder(
                title: AppLocalizations.of(context)!.history, icon: Icons.history, onPress: () {
                  Navigator.of(context).pushNamed("/history");
            }),
            ListTileWithBorder(
                title: AppLocalizations.of(context)!.becomeATutor,
                icon: Icons.grading,
                onPress: () {
                  Navigator.of(context).pushNamed("/become-a-tutor");
                }),
            ListTileWithBorder(
                title: AppLocalizations.of(context)!.settings, icon: Icons.settings, onPress: () {}),
            const SizedBox(height: StyleConst.kDefaultPadding * 2),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                StyleConst.defaultRadius))),
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.logOut.toUpperCase())))
          ],
        ),
      ),
    );
  }
}
