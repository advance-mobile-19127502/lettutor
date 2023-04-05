import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/become_tutor_bloc/become_tutor_bloc.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/ava_set_up_widget.dart';
import 'package:lettutor/common_widget/section_widget.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/basic_info_column.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/cv_column.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/text_form_field_become_a_tutor.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/who_i_teach_column.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/section_with_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController languageTextController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languageTextController = TextEditingController();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const AvaSetUpWidget(),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        SectionWidget(
          sectionTitle: AppLocalizations.of(context)!.basicInfo,
          fontSize: 16,
        ),
        const BasicInfoColumn(),
        const SectionWidget(
          sectionTitle: "CV  ",
          fontSize: 16,
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        const CVColumn(),
        SectionWidget(
          sectionTitle: AppLocalizations.of(context)!.languesISpeak,
          fontSize: 16,
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        TextFormFieldBecomeATutor(
          title: AppLocalizations.of(context)!.languages,
          hintTitle: AppLocalizations.of(context)!.hintLanguages,
          onTextChanged: (value) {
            BlocProvider.of<BecomeTutorBloc>(context).languages = value;
          },
        ),
        SectionWidget(
          sectionTitle: AppLocalizations.of(context)!.whoITeach,
          fontSize: 16,
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        const WhoITeachColumn(),
      ],
    );
  }
}
