import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_widget/change_locale_widget.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/pages/register_page/widgets/register_widget_column.dart';

import '../../constants/colors_const.dart';
import '../../constants/font_const.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formSignUpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.network(
                    "https://app.lettutor.com/static/media/login.8d01124a.png",
                    height: screenSize.height / 2.75,
                    fit: BoxFit.fitHeight,
                  ),

                  const SizedBox(
                    height: StyleConst.kDefaultPadding,
                  ),
                  //Say hello
                  Text(
                    "${appLocalizations.startLearning} \n"
                    "LetTutor",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: FontConst.semiBold.copyWith(
                            fontSize: 28, color: ColorConst.lightBlue)),
                  ),
                  //description
                  const SizedBox(
                    height: StyleConst.kDefaultPadding,
                  ),
                  Text(
                    appLocalizations.becomeFluent,
                    style: GoogleFonts.poppins(
                      textStyle: FontConst.regular.copyWith(fontSize: 16),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: StyleConst.kDefaultPadding,
                  ),

                  //Validate login
                  RegisterWidgetColumn(
                    formSignUpKey: _formSignUpKey,
                  ),

                  const SizedBox(
                    height: StyleConst.kDefaultPadding,
                  ),
                  //Or continue
                  Text(
                    appLocalizations.orContinue,
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular.copyWith(fontSize: 16)),
                  ),

                  const SizedBox(
                    height: StyleConst.kDefaultPadding / 2,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/images/fb_icon.svg")),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              "assets/images/google_icon.svg")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        appLocalizations.alreadyHaveAccount,
                        style: GoogleFonts.roboto(
                            textStyle:
                                FontConst.regular.copyWith(fontSize: 14)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            appLocalizations.login,
                            style: GoogleFonts.roboto(
                                textStyle:
                                    FontConst.regular.copyWith(fontSize: 14)),
                          ))
                    ],
                  )
                ],
              ),
              const Positioned(right: 0, child: ChangeLocaleWidget()),
            ],
          ),
        ),
      ),
    ));
  }
}
