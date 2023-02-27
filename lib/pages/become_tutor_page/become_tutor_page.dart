import 'package:flutter/material.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/become_tutor_page/page_view/approval_page.dart';
import 'package:lettutor/pages/become_tutor_page/page_view/complete_profile_page.dart';
import 'package:lettutor/pages/become_tutor_page/page_view/video_introduction_page.dart';
import 'package:lettutor/pages/become_tutor_page/widgets/stepper_widget.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class BecomeTutorPage extends StatefulWidget {
  const BecomeTutorPage({Key? key}) : super(key: key);

  @override
  State<BecomeTutorPage> createState() => _BecomeTutorPageState();
}

class _BecomeTutorPageState extends State<BecomeTutorPage> {
  int _currentStep = 0;
  late PageController _pageController;
  List<Widget> becomeTutorPages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _currentStep);

    becomeTutorPages = [
      const CompleteProfilePage(),
      const VideoIntroductionPage(),
      const ApprovalPage()
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StepperWidget(curentIndex: _currentStep),

                  const SizedBox(height: StyleConst.kDefaultPadding,),

                  ExpandablePageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: becomeTutorPages,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _currentStep > 0
                          ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _currentStep -= 1;
                              _pageController.jumpToPage(_currentStep);
                            });
                          },
                          child: const Text("cancel"))
                          : const SizedBox(),
                      _currentStep < 2
                          ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _currentStep += 1;
                              _pageController.jumpToPage(_currentStep);
                            });
                          },
                          child: const Text("next"))
                          : const SizedBox(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
