import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/bloc/user_bloc/user_bloc.dart';
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
  late String country;

  // late TextEditingController _levelController;
  // late TextEditingController _wantToLearnController;
  // late TextEditingController _studyScheduleController;
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _countryController = TextEditingController();
    _phoneController = TextEditingController();
    _dobController = TextEditingController();
    country = userBloc.accountInfo?.user?.country ?? "";
    // _levelController = TextEditingController();
    // _wantToLearnController = TextEditingController();
    // _studyScheduleController = TextEditingController();
    if (userBloc.accountInfo?.user?.birthday != null) {
      _dobController.text = userBloc.accountInfo!.user!.birthday!;
    }
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
    // _levelController.dispose();
    // _wantToLearnController.dispose();
    // _studyScheduleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocConsumer<UserBloc, UserState>(
      bloc: userBloc,
      listener: (context, state) {
        if (state is UpdateInfoFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Upload info failed, try again",
              ),
            ),
          );
        }
        if (state is UserSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Upload successfully",
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: state is UserLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
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
                            textProfile: userBloc.accountInfo?.user?.name ?? "",
                          ),
                          FormFieldWidget(
                            title: AppLocalizations.of(context)!.emailAddress,
                            hintTitle: "Example@gmail.com",
                            isEnabled: false,
                            controller: _emailController,
                            textProfile:
                                userBloc.accountInfo?.user?.email ?? "",
                          ),

                          Text(
                            AppLocalizations.of(context)!.country,
                            style: GoogleFonts.openSans(
                                textStyle:
                                    FontConst.semiBold.copyWith(fontSize: 14)),
                          ),
                          const SizedBox(
                            height: StyleConst.kDefaultPadding / 3,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(
                                  StyleConst.defaultRadius),
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
                          FormFieldWidget(
                            title: AppLocalizations.of(context)!.phoneNumber,
                            hintTitle: "0123456879",
                            isEnabled: false,
                            controller: _phoneController,
                            textProfile:
                                userBloc.accountInfo?.user?.phone ?? "",
                          ),

                          Text(
                            AppLocalizations.of(context)!.birthDay,
                            style: GoogleFonts.openSans(
                                textStyle:
                                    FontConst.semiBold.copyWith(fontSize: 14)),
                          ),
                          const SizedBox(
                            height: StyleConst.kDefaultPadding / 3,
                          ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.always,
                            controller: _dobController,
                            readOnly: true,
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
                                  borderSide: const BorderSide(
                                      color: ColorConst.hintTextColor),
                                  borderRadius: BorderRadius.circular(
                                      StyleConst.defaultRadius)),
                            ),
                          ),
                          const SizedBox(
                            height: StyleConst.kDefaultPadding,
                          ),
                          // FormFieldWidget(
                          //   title: AppLocalizations.of(context)!.myLevel,
                          //   hintTitle: "",
                          //   isEnabled: true,
                          //   controller: _levelController,
                          //   textProfile: myProfile.myLevel,
                          // ),
                          // FormFieldWidget(
                          //   title: AppLocalizations.of(context)!.wantToLearn,
                          //   hintTitle: "",
                          //   isEnabled: true,
                          //   controller: _wantToLearnController,
                          //   textProfile: myProfile.wantToLearn,
                          // ),
                          // FormFieldWidget(
                          //   title: AppLocalizations.of(context)!.studySchedule,
                          //   hintTitle: AppLocalizations.of(context)!.noteTheTime,
                          //   isEnabled: true,
                          //   controller: _studyScheduleController,
                          //   textProfile: myProfile.studySchedule,
                          // ),
                          SizedBox(
                            width: screenSize.width,
                            child: ElevatedButton(
                              child: Text(AppLocalizations.of(context)!.save),
                              onPressed: () {
                                updateInfo();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  void selectDate(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: userBloc.accountInfo?.user?.birthday != null
            ? DateFormat("yyyy-MM-dd")
                .parse(userBloc.accountInfo!.user!.birthday!)
            : DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (datePicked != null) {
      _dobController.text = DateFormat("yyyy-MM-dd").format(datePicked);
    }
  }

  void updateInfo() {
    userBloc.add(
        UpdateInfoEvent(_nameController.text, country, _dobController.text));
  }
}
