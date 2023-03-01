import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/pages/register_page/widgets/sign_up_form_field.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpWidgetColumn extends StatefulWidget {
  const SignUpWidgetColumn({Key? key, required this.formSignUpKey})
      : super(key: key);
  final GlobalKey<FormState> formSignUpKey;

  @override
  State<SignUpWidgetColumn> createState() => _SignUpWidgetColumnState();
}

class _SignUpWidgetColumnState extends State<SignUpWidgetColumn> {
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formSignUpKey,
      autovalidateMode: AutovalidateMode.always,
      onChanged: () {
        setState(() {
          isValid = widget.formSignUpKey.currentState!.validate();
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpFormField(),
          ElevatedButton(
              onPressed: !isValid
                  ? null
                  : () {
                      Navigator.of(context).pushNamed("/login");
                    },
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.signUp.toUpperCase(),
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.semiBold.copyWith(fontSize: 20)),
                ),
              ))
        ],
      ),
    );
  }
}
