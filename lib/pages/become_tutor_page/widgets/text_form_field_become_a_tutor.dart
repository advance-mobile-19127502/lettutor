

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class TextFormFieldBecomeATutor extends StatefulWidget {
  const TextFormFieldBecomeATutor({Key? key, required this.title, required this.hintTitle}) : super(key: key);

  final String title, hintTitle;

  @override
  State<TextFormFieldBecomeATutor> createState() => _TextFormFieldBecomeATutorState();
}

class _TextFormFieldBecomeATutorState extends State<TextFormFieldBecomeATutor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.openSans(
              textStyle: FontConst.regular
                  .copyWith(fontSize: 14)),
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),
        TextFormField(
          minLines: 1,
          maxLines: 5,
          autovalidateMode: AutovalidateMode.always,
          validator: (value) {
            return value!.isNotEmpty ? null : "Please input value";
          },
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorConst.hintTextColor),
                borderRadius: BorderRadius.circular(StyleConst.defaultRadius)),
            hintText: widget.hintTitle,
          ),
        ),

        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),

      ],
    );
  }
}
