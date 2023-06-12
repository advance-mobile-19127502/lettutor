import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/pages/forgot_pass_page/widgets/forgot_pass_column.dart';

class ForgotPassPage extends StatelessWidget {
  ForgotPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
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
                  const ForgotPassColumn(),
                ],
              ),
            ),
          ),
        ));
  }
}
