import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/pages/login_page/widgets/login_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/route_generator.dart';

class LoginWidgetColumn extends StatefulWidget {
  const LoginWidgetColumn({Key? key, required this.formLoginKey})
      : super(key: key);
  final GlobalKey<FormState> formLoginKey;

  @override
  State<LoginWidgetColumn> createState() => _LoginWidgetColumnState();
}

class _LoginWidgetColumnState extends State<LoginWidgetColumn> {
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formLoginKey,
      onChanged: () {
        setState(() {
          isValid = widget.formLoginKey.currentState!.validate();
        });
      },
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoginFormField(),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteGenerator.forgotPassRoute);
              },
              child: Text(AppLocalizations.of(context)!.forgotPassword)),
          ElevatedButton(
              onPressed: !isValid
                  ? null
                  : () {
                      Navigator.of(context)
                          .pushNamed(RouteGenerator.mainPageRoute);
                    },
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.login.toUpperCase(),
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.semiBold.copyWith(fontSize: 20)),
                ),
              ))
        ],
      ),
    );
  }
}
