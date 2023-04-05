import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/become_tutor_bloc/become_tutor_bloc.dart';
import 'package:lettutor/bloc/booking_history_bloc/booking_history_bloc.dart';
import 'package:lettutor/bloc/course_detail_bloc/course_detail_bloc.dart';
import 'package:lettutor/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/bloc/register_bloc/register_bloc.dart';
import 'package:lettutor/bloc/tutor_detail_bloc/tutor_detail_bloc.dart';
import 'package:lettutor/bloc/user_bloc/user_bloc.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/pages/become_tutor_page/become_tutor_page.dart';
import 'package:lettutor/pages/course_detail_page/course_detail_page.dart';
import 'package:lettutor/pages/course_detail_page/pdf_view_page.dart';
import 'package:lettutor/pages/edit_your_profile_page/edit_your_profile_page.dart';
import 'package:lettutor/pages/forgot_pass_page/forgot_pass_page.dart';
import 'package:lettutor/pages/history_page/history_page.dart';
import 'package:lettutor/pages/login_page/login_page.dart';
import 'package:lettutor/pages/main_page/main_page.dart';
import 'package:lettutor/pages/register_page/register_page.dart';
import 'package:lettutor/pages/splash_screen/splash_screen.dart';
import 'package:lettutor/pages/tutor_detail_page/tutor_detail_page.dart';
import 'package:lettutor/repositories/auth_repository.dart';
import 'package:lettutor/repositories/booking_repository.dart';
import 'package:lettutor/repositories/course_repository.dart';
import 'package:lettutor/repositories/tutor_repository.dart';
import 'package:lettutor/repositories/user_repository.dart';

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
  static const String pdfViewerRoute = '/pdf-view';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case forgotPassRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ForgotPasswordBloc(
                      UserRepository("${UrlConst.baseUrl}/user")),
                  child: ForgotPassPage(),
                ));
      case registerRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      RegisterBloc(AuthRepository("${UrlConst.baseUrl}/auth")),
                  child: RegisterPage(),
                ));
      case mainPageRoute:
        return MaterialPageRoute(builder: (context) => const MainPage());
      case courseDetailRoute:
        {
          final routeArgs = settings.arguments as Map;
          final String courseId = routeArgs['courseId'] as String;
          final String courseName = routeArgs['courseName'] as String;

          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => CourseDetailBloc(
                        CourseRepository("${UrlConst.baseUrl}/course"))
                      ..add(CourseDetailEvent(courseId)),
                    child: CourseDetailPage(courseName: courseName),
                  ));
        }
      case tutorDetailRoute:
        {
          final routeArgs = settings.arguments as Map;
          final String? tutorId = routeArgs['tutorID'] as String?;
          final ListTutorBloc listTutorBloc =
              routeArgs["listTutorBloc"] as ListTutorBloc;
          return MaterialPageRoute(
              builder: (context) => MultiBlocProvider(providers: [
                    BlocProvider(
                        create: (BuildContext context) => TutorDetailBloc(
                            TutorRepository("${UrlConst.baseUrl}/tutor"))
                          ..add(FetchTutorDetailEvent(tutorId))),
                    BlocProvider.value(value: listTutorBloc),
                  ], child: const TutorDetailPage()));
        }
      case editProfileRoute:
        {
          final routeArgs = settings.arguments as Map;

          final UserBloc userBloc = routeArgs["userBloc"] as UserBloc;
          return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                  value: userBloc, child: const EditYourProfilePage()));
        }
      case becomeTutorRoute:
        {
          final routeArgs = settings.arguments as Map;

          final UserBloc userBloc = routeArgs["userBloc"] as UserBloc;
          return MaterialPageRoute(
              builder: (context) => MultiBlocProvider(providers: [
                    BlocProvider.value(value: userBloc),
                    BlocProvider(
                        create: (context) => BecomeTutorBloc(
                            TutorRepository("${UrlConst.baseUrl}/tutor")))
                  ], child: const BecomeTutorPage()));
        }
      case historyRoute:
        {
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (BuildContext context) =>
                      BookingHistoryBloc(BookingRepository(UrlConst.baseUrl))
                        ..add(FetchBookingHistoryEvent()),
                  child: const HistoryPage()));
        }
      case pdfViewerRoute:
        {
          final routeArgs = settings.arguments as Map;
          final String pdfUrl = routeArgs['pdfUrl'] as String;
          final String pdfName = routeArgs['pdfName'] as String;

          return MaterialPageRoute(
              builder: (context) =>
                  PdfViewPage(pdfUrl: pdfUrl, pdfName: pdfName));
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
