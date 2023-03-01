import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_widget/section_widget.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/alert_container.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/introducde_yourself_row.dart';

class VideoIntroductionPage extends StatefulWidget {
  const VideoIntroductionPage({Key? key}) : super(key: key);

  @override
  State<VideoIntroductionPage> createState() => _VideoIntroductionPageState();
}

class _VideoIntroductionPageState extends State<VideoIntroductionPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IntroduceYourselfRow(),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        SectionWidget(
          sectionTitle: AppLocalizations.of(context)!.introductionVideo,
          fontSize: 16,
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        AlertContainer(
          alertContent: "${AppLocalizations.of(context)!.aFewHelpfulTips}\n"
              "   1. ${AppLocalizations.of(context)!.firstTips}\n"
              "   2. ${AppLocalizations.of(context)!.secondTips}\n"
              "   3. ${AppLocalizations.of(context)!.thirdTips}\n"
              "   4. ${AppLocalizations.of(context)!.fourthTips}\n"
              "   5. Brand yourself and have fun!\n",
          noteContent: AppLocalizations.of(context)!.noteVideoIntroduction,
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),

        ElevatedButton(onPressed: () {}, child: Text(AppLocalizations.of(context)!.chooseVideo)),

        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        
        Image.network("https://www.addictivetips.com/app/uploads/2017/02/youtube-full-screen.jpg"),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
      ],
    );
  }
}
