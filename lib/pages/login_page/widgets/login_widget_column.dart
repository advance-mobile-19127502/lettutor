

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/pages/login_page/widgets/login_form_field.dart';

class LoginWidgetColumn extends StatelessWidget {
  LoginWidgetColumn({Key? key}) : super(key: key);
  final _formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formLoginKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const LoginFormField(),


          TextButton(
              onPressed: () {},
              child: const Text("Forgot Password?")),
          ElevatedButton(
              onPressed: _formLoginKey.currentState == null ||
                  !_formLoginKey.currentState!.validate()
                  ? null
                  : () {
                Navigator.of(context).pushNamed("/main-page");
              },
              child: Center(
                child: Text(
                  "LOG IN",
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
