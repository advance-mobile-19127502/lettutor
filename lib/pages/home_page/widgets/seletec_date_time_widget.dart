import 'package:flutter/material.dart';
import 'package:lettutor/pages/home_page/widgets/text_form_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SelectDateTimeWidget extends StatefulWidget {
  const SelectDateTimeWidget({Key? key}) : super(key: key);

  @override
  State<SelectDateTimeWidget> createState() => _SelectDateTimeWidgetState();
}

class _SelectDateTimeWidgetState extends State<SelectDateTimeWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    return TextFormWidget(
      hintTitle: AppLocalizations.of(context)!.selectADay,
      widthSize: screenSize.width / 2.6,
      icon: Icons.calendar_month,
      onPressIcon: pickDateTime
    );
  }

  void pickDateTime() async {
    DateTime? newDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));//
  }
}
