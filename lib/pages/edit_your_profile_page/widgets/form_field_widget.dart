import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({Key? key, required this.title, required this.hintTitle, required this.isEnabled}) : super(key: key);

  final String title, hintTitle;
  final bool isEnabled;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.openSans(
              textStyle: FontConst.semiBold
                  .copyWith(fontSize: 14)),
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.always,
          validator: (value) {
            if (widget.isEnabled) {
              return null;
            }
            return value!.isNotEmpty ? null : "Please input value";
          },
          enabled: widget.isEnabled,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorConst.hintTextColor),
                borderRadius: BorderRadius.circular(StyleConst.defaultRadius)),
            hintText: widget.hintTitle,
          ),
        ),
      ],
    );
  }
}
