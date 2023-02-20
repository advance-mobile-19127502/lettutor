import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {Key? key, required this.hintTitle, required this.widthSize, this.icon, this.onPressIcon})
      : super(key: key);
  final String hintTitle;
  final double widthSize;
  final IconData? icon;
  final VoidCallback? onPressIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize,
      child: TextField(
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(25)),
            hintText: hintTitle,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            suffixIconConstraints: BoxConstraints(maxHeight: 14),
            suffixIcon: icon != null
                ? IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onPressIcon,
                    icon: Icon(icon, size: 14,),
                  )
                : null),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
