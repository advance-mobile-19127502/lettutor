import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/my_profile.dart';
import 'package:lettutor/pages/edit_your_profile_page/widgets/edit_ava_profile.dart';
import 'package:lettutor/pages/edit_your_profile_page/widgets/form_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EditYourProfilePage extends StatefulWidget {
  const EditYourProfilePage({Key? key}) : super(key: key);

  @override
  State<EditYourProfilePage> createState() => _EditYourProfilePageState();
}

class _EditYourProfilePageState extends State<EditYourProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _countryController;
  late TextEditingController _phoneController;
  late TextEditingController _dobController;
  late TextEditingController _levelController;
  late TextEditingController _wantToLearnController;
  late TextEditingController _studyScheduleController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _countryController = TextEditingController();
    _phoneController = TextEditingController();
    _dobController = TextEditingController();
    _levelController = TextEditingController();
    _wantToLearnController = TextEditingController();
    _studyScheduleController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _levelController.dispose();
    _wantToLearnController.dispose();
    _studyScheduleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const EditAvaProfile(),
                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),
                FormFieldWidget(
                  title: AppLocalizations.of(context)!.name,
                  hintTitle: "",
                  isEnabled: true,
                  controller: _nameController,
                  textProfile: myProfile.name,
                ),
                FormFieldWidget(
                  title: AppLocalizations.of(context)!.emailAddress,
                  hintTitle: "Example@gmail.com",
                  isEnabled: false,
                  controller: _emailController,
                  textProfile: myProfile.email,
                ),
                FormFieldWidget(
                  title: AppLocalizations.of(context)!.country,
                  hintTitle: "",
                  isEnabled: true,
                  controller: _countryController,
                  textProfile: myProfile.country,
                ),
                FormFieldWidget(
                  title: AppLocalizations.of(context)!.phoneNumber,
                  hintTitle: "0123456879",
                  isEnabled: true,
                  controller: _phoneController,
                  textProfile: myProfile.phoneNumber,
                ),
                FormFieldWidget(
                  title: AppLocalizations.of(context)!.birthDay,
                  hintTitle: "",
                  isEnabled: true,
                  controller: _dobController,
                  textProfile: myProfile.dateOfBirth.toString(),
                ),
                FormFieldWidget(
                  title: AppLocalizations.of(context)!.myLevel,
                  hintTitle: "",
                  isEnabled: true,
                  controller: _levelController,
                  textProfile: myProfile.myLevel,
                ),
                FormFieldWidget(
                  title: AppLocalizations.of(context)!.wantToLearn,
                  hintTitle: "",
                  isEnabled: true,
                  controller: _wantToLearnController,
                  textProfile: myProfile.wantToLearn,
                ),
                FormFieldWidget(
                  title: AppLocalizations.of(context)!.studySchedule,
                  hintTitle: AppLocalizations.of(context)!.noteTheTime,
                  isEnabled: true,
                  controller: _studyScheduleController,
                  textProfile: myProfile.studySchedule,
                ),
                SizedBox(
                  width: screenSize.width,
                  child: ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.save),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
