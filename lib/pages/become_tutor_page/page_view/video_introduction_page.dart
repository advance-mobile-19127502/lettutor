import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/bloc/become_tutor_bloc/become_tutor_bloc.dart';
import 'package:lettutor/common_widget/section_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/alert_container.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/introducde_yourself_row.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoIntroductionPage extends StatefulWidget {
  const VideoIntroductionPage({Key? key}) : super(key: key);

  @override
  State<VideoIntroductionPage> createState() => _VideoIntroductionPageState();
}

class _VideoIntroductionPageState extends State<VideoIntroductionPage>
    with AutomaticKeepAliveClientMixin {
  late ImagePicker videoPicker;
  late BecomeTutorBloc becomeTutorBloc;
  VideoPlayerController? videoPlayerController;

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
    print("dispose video screen");
    super.dispose();
    videoPlayerController?.dispose();
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
        if (videoPlayerController != null)
          VisibilityDetector(
            key: const Key("VideoPlayerKey"),
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 0 && mounted) {
                videoPlayerController?.pause();
              } else {
                videoPlayerController?.play();
              }
            },
            child: InkWell(
              onTap: () {
                setState(() {
                  videoPlayerController!.value.isPlaying
                      ? videoPlayerController?.pause()
                      : videoPlayerController?.play();
                });
              },
              child: AspectRatio(
                aspectRatio: videoPlayerController!.value.aspectRatio,
                child: Stack(
                  children: [
                    VideoPlayer(videoPlayerController!),
                    Align(
                      alignment: Alignment.center,
                      child: videoPlayerController!.value.isPlaying
                          ? const SizedBox()
                          : const Icon(Icons.pause),
                    ),
                  ],
                ),
              ),
            ),
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
      videoPlayerController?.dispose();
      videoPlayerController = VideoPlayerController.file(File(videoPicked.path))
        ..initialize().then((value) {
          setState(() {});
          videoPlayerController?.setLooping(true);
          videoPlayerController?.play();
        });
    }
  }
}
