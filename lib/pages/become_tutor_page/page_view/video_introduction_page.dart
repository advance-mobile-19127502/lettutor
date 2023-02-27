import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_widget/section_widget.dart';
import 'package:lettutor/constants/font_const.dart';
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
        const SectionWidget(
          sectionTitle: "Basic info  ",
          fontSize: 16,
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
        AlertContainer(
          alertContent: "A few helpful tips:\n"
              "   1. Find a clean and quiet space\n"
              "   2. Smile and look at the camera\n"
              "   3. Dress smart\n"
              "   4. Speak for 1-3 minutes\n"
              "   5. Brand yourself and have fun!\n",
          noteContent: "Note: We only support uploading video file"
              " that is less than 64 MB in size.",
        ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),

        ElevatedButton(onPressed: () {}, child: const Text("Choose video")),

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
