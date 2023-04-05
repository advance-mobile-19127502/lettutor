import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/become_tutor_bloc/become_tutor_bloc.dart';
import 'package:lettutor/bloc/user_bloc/user_bloc.dart';
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
  late UserBloc userBloc;
  late BecomeTutorBloc becomeTutorBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
    becomeTutorBloc = BlocProvider.of<BecomeTutorBloc>(context);

    if (userBloc.accountInfo?.user?.tutorInfo != null) {
      _currentStep = 2;
      _pageController = PageController(initialPage: _currentStep);
    } else {
      _pageController = PageController();
    }

    becomeTutorPages = [
      const CompleteProfilePage(),
      const VideoIntroductionPage(),
      const ApprovalPage()
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<UserBloc, UserState>(
        bloc: userBloc,
        listener: (context, userState) {
          if (userState is UserSuccess) {
            if (userBloc.accountInfo?.user?.tutorInfo != null) {
              _currentStep = 2;
            }
            _pageController = PageController(initialPage: _currentStep);
          }
        },
        builder: (context, userState) {
          if (userState is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (userState is UserError) {
            return const Center(
              child: Text("Failed to get information, please try again"),
            );
          }
          return BlocConsumer<BecomeTutorBloc, BecomeTutorState>(
            bloc: becomeTutorBloc,
            listener: (context, becomeTutorState) {
              if (becomeTutorState is BecomeTutorInvalid) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(becomeTutorState.messageValid),
                  ),
                );
              }
              if (becomeTutorState is BecomeTutorNext) {
                _currentStep++;
                _pageController.jumpToPage(_currentStep);
              }
              if (becomeTutorState is BecomeTutorBack) {
                _currentStep--;
                _pageController.jumpToPage(_currentStep);
              }
              if (becomeTutorState is BecomeTutorLoading) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return WillPopScope(
                          child: Stack(
                            children: const [
                              ModalBarrier(
                                  dismissible: false, color: Colors.black54),
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          ),
                          onWillPop: () async => false);
                    });
              }
              if (becomeTutorState is BecomeTutorSuccess) {
                Navigator.pop(context);
                _currentStep++;
                _pageController.jumpToPage(_currentStep);
              }
              if (becomeTutorState is BecomeTutorErrorSendReq) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Failed to send request become a tutor, please try again!"),
                  ),
                );
              }
            },
            builder: (context, becomeTutorState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StepperWidget(curentIndex: _currentStep),
                          const SizedBox(
                            height: StyleConst.kDefaultPadding,
                          ),
                          ExpandablePageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            children: becomeTutorPages,
                          ),
                          if (_currentStep == 0)
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                  onPressed: () {
                                    becomeTutorBloc
                                        .add(const NextTutorProfile());
                                  },
                                  child: const Text("next")),
                            )
                          else if (_currentStep == 1)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      becomeTutorBloc
                                          .add(const BackTutorProfile());
                                    },
                                    child: const Text("Back")),
                                ElevatedButton(
                                    onPressed: () {
                                      becomeTutorBloc
                                          .add(const SendBecomeATutorEvent());
                                    },
                                    child: const Text("Send"))
                              ],
                            )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
