import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor_info.dart';
import 'package:lettutor/pages/login_page/login_page.dart';
import 'package:lettutor/pages/main_page/main_page.dart';
import 'package:lettutor/pages/register_page/register_page.dart';
import 'package:lettutor/pages/splash_screen/splash_screen.dart';
import 'package:lettutor/pages/tutor_detail_page/tutor_detail_page.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case '/main-page':
        return MaterialPageRoute(builder: (context) => const MainPage());
      case '/tutor-detail':
        {
          final routeArgs = settings.arguments as Map;
          final Tutor tutorDetail = routeArgs['tutor'] as Tutor;
          return MaterialPageRoute(builder: (context) => Provider(
            create: (_) => tutorDetail,
            child: TutorDetailPage(),
          ));
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
