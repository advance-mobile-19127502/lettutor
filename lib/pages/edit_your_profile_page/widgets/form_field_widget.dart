import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget(
      {Key? key,
      required this.title,
      required this.hintTitle,
      required this.isEnabled,
      required this.controller,
      required this.textProfile})
      : super(key: key);

  final String title, hintTitle;
  final bool isEnabled;
  final TextEditingController controller;
  final String textProfile;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.textProfile.isNotEmpty) {
      widget.controller.text = widget.textProfile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.openSans(
              textStyle: FontConst.semiBold.copyWith(fontSize: 14)),
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.always,
          controller: widget.controller,
          validator: (value) {
            if (widget.isEnabled) {
              return null;
            }
            return value!.isNotEmpty ? null : "Please input value";
          },
          enabled: widget.isEnabled,
          style: TextStyle(
              fontSize: 14,
              color: widget.isEnabled ? Colors.black : Colors.grey),
          decoration: InputDecoration(
            fillColor: Colors.grey[300],
            filled: widget.isEnabled ? false : true,
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
