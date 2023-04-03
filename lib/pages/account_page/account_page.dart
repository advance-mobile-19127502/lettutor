import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/auth_bloc/auth_bloc.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/my_profile.dart';
import 'package:lettutor/pages/account_page/widgets/ava_name_mail_row.dart';
import 'package:lettutor/pages/account_page/widgets/list_tile_with_border.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/route_generator.dart';

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
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.editProfileRoute);
                }),
            ListTileWithBorder(
                title: AppLocalizations.of(context)!.history,
                icon: Icons.history,
                onPress: () {
                  Navigator.of(context).pushNamed(RouteGenerator.historyRoute);
                }),
            ListTileWithBorder(
                title: AppLocalizations.of(context)!.becomeATutor,
                icon: Icons.grading,
                onPress: () {
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.becomeTutorRoute);
                }),
            ListTileWithBorder(
                title: AppLocalizations.of(context)!.settings,
                icon: Icons.settings,
                onPress: () {}),
            const SizedBox(height: StyleConst.kDefaultPadding * 2),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                StyleConst.defaultRadius))),
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                    },
                    child: Text(
                        AppLocalizations.of(context)!.logOut.toUpperCase())))
          ],
        ),
      ),
    );
  }
}
