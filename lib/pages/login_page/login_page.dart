import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/login_page/widgets/login_widget_column.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formLoginKey = GlobalKey<FormState>();
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

              //Validate login
              LoginWidgetColumn(formLoginKey: _formLoginKey,),

              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              //Or continue
              Text(
                "Or continue with",
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
                      icon: SvgPicture.asset("assets/images/google_icon.svg")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member yer?",
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular.copyWith(fontSize: 14)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/register");
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.roboto(
                            textStyle:
                                FontConst.regular.copyWith(fontSize: 14)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
