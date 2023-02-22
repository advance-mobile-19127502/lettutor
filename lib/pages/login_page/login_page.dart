import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/login_page/widgets/login_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  //validate form login
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(StyleConst.kDefaultPadding),
          child: Column(
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
                "Say hello to your \n"
                "English tutors",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: FontConst.semiBold
                        .copyWith(fontSize: 28, color: ColorConst.lightBlue)),
              ),
              //description
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              Text(
                "Become fluent faster through one on one video chat lessons tailored to your goals.",
                style: GoogleFonts.poppins(
                  textStyle: FontConst.regular.copyWith(fontSize: 16),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),

              //email
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginFormField(),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?")),
                    ElevatedButton(
                        onPressed: formKey.currentState == null ||
                                !formKey.currentState!.validate()
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
              )
            ],
          ),
        ),
      ),
    ));
  }
}
