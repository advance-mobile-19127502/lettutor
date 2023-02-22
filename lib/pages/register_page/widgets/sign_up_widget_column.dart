

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/pages/register_page/widgets/sign_up_form_field.dart';

class SignUpWidgetColumn extends StatelessWidget {
  SignUpWidgetColumn({Key? key}) : super(key: key);
  final _formSignUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formSignUpKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignUpFormField(),

          ElevatedButton(
              onPressed: _formSignUpKey.currentState == null ||
                  !_formSignUpKey.currentState!.validate()
                  ? null
                  : () {
                Navigator.of(context).pushNamed("/login");
              },
              child: Center(
                child: Text(
                  "SIGN UP",
                  style: GoogleFonts.roboto(
                      textStyle:
                      FontConst.semiBold.copyWith(fontSize: 20)),
                ),
              ))
        ],
      ),
    );
  }
}
