import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/tutor_info.dart';
import 'package:lettutor/pages/become_tutor_page/become_tutor_page.dart';
import 'package:lettutor/pages/course_detail_page/course_detail_page.dart';
import 'package:lettutor/pages/edit_your_profile_page/edit_your_profile_page.dart';
import 'package:lettutor/pages/forgot_pass_page/forgot_pass_page.dart';
import 'package:lettutor/pages/history_page/history_page.dart';
import 'package:lettutor/pages/login_page/login_page.dart';
import 'package:lettutor/pages/main_page/main_page.dart';
import 'package:lettutor/pages/register_page/register_page.dart';
import 'package:lettutor/pages/splash_screen/splash_screen.dart';
import 'package:lettutor/pages/tutor_detail_page/tutor_detail_page.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String forgotPassRoute = '/forgot-pass';
  static const String registerRoute = '/register';
  static const String mainPageRoute = '/main-page';
  static const String courseDetailRoute = '/course-detail';
  static const String tutorDetailRoute = '//tutor-detail';
  static const String editProfileRoute = '/edit-your-profile';
  static const String becomeTutorRoute = '/become-a-tutor';
  static const String historyRoute = '/history';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case forgotPassRoute:
        return MaterialPageRoute(builder: (context) => const ForgotPassPage());
      case registerRoute:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case mainPageRoute:
        return MaterialPageRoute(builder: (context) => const MainPage());
      case courseDetailRoute:
        {
          final routeArgs = settings.arguments as Map;
          final Course courseDetail = routeArgs['course'] as Course;
          return MaterialPageRoute(
              builder: (context) => CourseDetailPage(
                    course: courseDetail,
                  ));
        }
      case tutorDetailRoute:
        {
          final routeArgs = settings.arguments as Map;
          final Tutor tutorDetail = routeArgs['tutor'] as Tutor;
          return MaterialPageRoute(
              builder: (context) => Provider(
                  create: (context) => tutorDetail,
                  child: const TutorDetailPage()));
        }
      case editProfileRoute:
        {
          return MaterialPageRoute(
              builder: (context) => const EditYourProfilePage());
        }
      case becomeTutorRoute:
        {
          return MaterialPageRoute(
              builder: (context) => const BecomeTutorPage());
        }
      case historyRoute:
        {
          return MaterialPageRoute(builder: (context) => const HistoryPage());
        }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Center(
            child: Text("Error"),
          ),
        ),
      );
    });
  }
}
