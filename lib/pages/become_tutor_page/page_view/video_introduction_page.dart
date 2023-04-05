import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/bloc/become_tutor_bloc/become_tutor_bloc.dart';
import 'package:lettutor/common_widget/section_widget.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/alert_container.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/introducde_yourself_row.dart';
import 'package:video_player/video_player.dart';

class VideoIntroductionPage extends StatefulWidget {
  VideoIntroductionPage({Key? key, this.videoPlayerController})
      : super(key: key);
  VideoPlayerController? videoPlayerController;
  @override
  State<VideoIntroductionPage> createState() => _VideoIntroductionPageState();
}

class _VideoIntroductionPageState extends State<VideoIntroductionPage>
    with AutomaticKeepAliveClientMixin {
  late ImagePicker videoPicker;
  late BecomeTutorBloc becomeTutorBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    becomeTutorBloc = BlocProvider.of<BecomeTutorBloc>(context);
    videoPicker = ImagePicker();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        ElevatedButton(
            onPressed: () async {
              await pickVideo();
            },
            child: Text(AppLocalizations.of(context)!.chooseVideo)),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),

        //Video controller
        if (widget.videoPlayerController != null)
          AspectRatio(
            aspectRatio: widget.videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(widget.videoPlayerController!),
          ),
        const SizedBox(
          height: StyleConst.kDefaultPadding,
        ),
      ],
    );
  }

  Future<void> pickVideo() async {
    final videoPicked =
        await videoPicker.pickVideo(source: ImageSource.gallery);
    if (videoPicked != null) {
      becomeTutorBloc.videoPath = videoPicked.path;
      widget.videoPlayerController =
          VideoPlayerController.file(File(videoPicked.path))
            ..initialize().then((value) {
              setState(() {});
              widget.videoPlayerController?.setLooping(true);
              widget.videoPlayerController?.play();
            });
    }
  }
}
