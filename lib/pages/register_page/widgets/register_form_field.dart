import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/register_bloc/register_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/utils/email_validation.dart';

class RegisterFormField extends StatefulWidget {
  const RegisterFormField(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  final TextEditingController emailController, passwordController;

  @override
  State<RegisterFormField> createState() => _RegisterFormFieldState();
}

class _RegisterFormFieldState extends State<RegisterFormField> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EMAIL",
              style: GoogleFonts.openSans(
                  textStyle: FontConst.semiBold
                      .copyWith(fontSize: 14, color: Colors.grey)),
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 3,
            ),
            TextFormField(
              controller: widget.emailController,
              autovalidateMode: AutovalidateMode.always,
              validator: validateEmail,
              enabled: state is RegisterLoading ? false : true,
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
            const SizedBox(
              height: StyleConst.kDefaultPadding / 3,
            ),
            Text(
              AppLocalizations.of(context)!.password,
              style: GoogleFonts.openSans(
                  textStyle: FontConst.semiBold
                      .copyWith(fontSize: 14, color: Colors.grey)),
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 3,
            ),
            TextFormField(
              controller: widget.passwordController,
              autovalidateMode: AutovalidateMode.always,
              enabled: state is RegisterLoading ? false : true,
              validator: validatePassword,
              obscureText: _obsecureText,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: ColorConst.hintTextColor),
                      borderRadius:
                          BorderRadius.circular(StyleConst.defaultRadius)),
                  hintText: "*******",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obsecureText = !_obsecureText;
                      });
                    },
                    icon: Icon(_obsecureText
                        ? Icons.visibility
                        : Icons.visibility_off),
                  )),
            )
          ],
        );
      },
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.inputMail;
    }
    if (!value.isValidEmail) {
      return AppLocalizations.of(context)!.validEmail;
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.inputPassword;
    }
    if (value.length < 6) {
      return AppLocalizations.of(context)!.validPassword;
    } else {
      return null;
    }
  }
}
