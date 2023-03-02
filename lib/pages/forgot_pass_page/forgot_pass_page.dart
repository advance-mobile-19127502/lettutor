import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.resetPass,
                style: GoogleFonts.poppins(
                    textStyle: FontConst.semiBold.copyWith(fontSize: 30)),
              ),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              Text(
                AppLocalizations.of(context)!.plsEnterEmail,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    textStyle: FontConst.regular.copyWith(fontSize: 14)),
              ),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email",
                      style: GoogleFonts.openSans(
                          textStyle: FontConst.regular.copyWith(fontSize: 14))),
                  const SizedBox(
                    height: StyleConst.kDefaultPadding / 2,
                  ),
                  TextField(
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorConst.hintTextColor),
                          borderRadius:
                              BorderRadius.circular(StyleConst.defaultRadius)),
                      hintText: "email@example.com",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.sendResetLink,
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular.copyWith(fontSize: 14)),
                  ))
            ],
          ),
        ));
  }
}
