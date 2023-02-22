

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField({Key? key}) : super(key: key);

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {

  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
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
          autovalidateMode:AutovalidateMode.always,
          validator: validateEmail,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
                borderSide:
                const BorderSide(color: ColorConst.hintTextColor),
                borderRadius: BorderRadius.circular(
                    StyleConst.defaultRadius)),
            hintText: "email@example.com",
          ),
        ),

        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),

        Text(
          "PASSWORD",
          style: GoogleFonts.openSans(
              textStyle: FontConst.semiBold
                  .copyWith(fontSize: 14, color: Colors.grey)),
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),

        TextFormField(
          autovalidateMode: AutovalidateMode.always,
          validator: validatePassword,
          obscureText: _obsecureText,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
                borderSide:
                const BorderSide(color: ColorConst.hintTextColor),
                borderRadius: BorderRadius.circular(
                    StyleConst.defaultRadius)),
            hintText: "*******",
            suffixIcon: IconButton(onPressed: () {
              setState(() {
                _obsecureText = !_obsecureText;
              });
            }, icon: Icon(_obsecureText ? Icons.visibility : Icons.visibility_off),)
          ),
        )
      ],
    );
  }

  String? validateEmail(String? value) {
      if (value == null || value.isEmpty)
      {
        return "Please input your Email!";
      }
      if (value.length < 7)
      {
        return "The input is not valid E-mail!";
      }
      else
      {
        return null;
      }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty)
    {
      return "Please input your Password!";
    }
    if (value.length < 7)
    {
      return "Enter min. 7 characters";
    }
    else
    {
      return null;
    }
  }
}
