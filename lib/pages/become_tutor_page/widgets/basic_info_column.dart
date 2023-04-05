import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/bloc/become_tutor_bloc/become_tutor_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/alert_container.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/text_form_field_become_a_tutor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasicInfoColumn extends StatefulWidget {
  const BasicInfoColumn({Key? key}) : super(key: key);

  @override
  State<BasicInfoColumn> createState() => _BasicInfoColumnState();
}

class _BasicInfoColumnState extends State<BasicInfoColumn> {
  ImageProvider? imageProvider;
  late ImagePicker imagePicker;
  late BecomeTutorBloc becomeTutorBloc;
  String country = "vn";

  late TextEditingController dobTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    becomeTutorBloc = BlocProvider.of<BecomeTutorBloc>(context);
    dobTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage: imageProvider,
            radius: 50,
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () async {
                  await uploadAvatar();
                },
                child: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        AlertContainer(
            alertContent: AppLocalizations.of(context)!.plsUpProPhoto),
        TextFormFieldBecomeATutor(
          title: AppLocalizations.of(context)!.tutoringName,
          hintTitle: '',
          onTextChanged: (value) {
            BlocProvider.of<BecomeTutorBloc>(context).name = value;
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.imFrom,
            style: GoogleFonts.openSans(
                textStyle: FontConst.regular.copyWith(fontSize: 14)),
          ),
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
            border: Border.all(
              color: Colors.black38,
              width: 1,
            ),
          ),
          height: 56,
          child: CountryCodePicker(
            onChanged: (CountryCode countryCode) {
              setState(() {
                country = countryCode.code.toString();
              });
              BlocProvider.of<BecomeTutorBloc>(context).country = country;
            },
            initialSelection: country,
            showOnlyCountryWhenClosed: true,
            showCountryOnly: true,
            alignLeft: true,
          ),
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.dob,
            style: GoogleFonts.openSans(
                textStyle: FontConst.regular.copyWith(fontSize: 14)),
          ),
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding / 3,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.always,
          controller: dobTextController,
          readOnly: true,
          validator: (value) {
            return value!.isNotEmpty ? null : "Please input value";
          },
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () async {
                selectDate(context);
              },
            ),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorConst.hintTextColor),
                borderRadius: BorderRadius.circular(StyleConst.defaultRadius)),
          ),
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
      ],
    );
  }

  Future<void> uploadAvatar() async {
    final imagePickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePickedFile != null) {
      setState(() {
        imageProvider = FileImage(File(imagePickedFile.path));
      });
      becomeTutorBloc.imagePath = imagePickedFile.path;
    }
  }

  void selectDate(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (datePicked != null) {
      dobTextController.text = DateFormat("yyyy-MM-dd").format(datePicked);
      becomeTutorBloc.birthDay = dobTextController.text;
    }
  }
}
