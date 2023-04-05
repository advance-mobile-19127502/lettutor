import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/auth_bloc/auth_bloc.dart';
import 'package:lettutor/bloc/booking_history_bloc/booking_history_bloc.dart';
import 'package:lettutor/bloc/list_course_bloc/list_course_bloc.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/bloc/total_time_bloc/total_time_bloc.dart';
import 'package:lettutor/bloc/user_bloc/user_bloc.dart';
import 'package:lettutor/common_widget/change_locale_widget.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/models/from_api/booking_history.dart';
import 'package:lettutor/pages/account_page/account_page.dart';
import 'package:lettutor/pages/course_page/course_page.dart';
import 'package:lettutor/pages/home_page/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/pages/schedule_page/schedule_page.dart';
import 'package:lettutor/repositories/booking_repository.dart';
import 'package:lettutor/repositories/course_repository.dart';
import 'package:lettutor/repositories/total_time_repository.dart';
import 'package:lettutor/repositories/tutor_repository.dart';
import 'package:lettutor/repositories/user_repository.dart';
import 'package:lettutor/route_generator.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> listPages = [
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => ListTutorBloc(
            TutorRepository("${UrlConst.baseUrl}/tutor"),
            UserRepository("${UrlConst.baseUrl}/user"))
          ..add(const FetchListTutorEvent(10)),
      ),
      BlocProvider(
          create: (context) => TotalTimeBloc(MainRepository(UrlConst.baseUrl))
            ..add(const TotalTimeEvent()))
    ], child: const HomePage()),
    BlocProvider(
        create: (BuildContext context) =>
            BookingHistoryBloc(BookingRepository(UrlConst.baseUrl))
              ..add(FetchBookingEvent()),
        child: const SchedulePage()),
    BlocProvider(
        create: (BuildContext context) => ListCourseBloc(
            CourseRepository("${UrlConst.baseUrl}/course"),
            MainRepository(UrlConst.baseUrl))
          ..add(FetchListCourse()),
        child: const CoursePage()),
    BlocProvider(
        create: (BuildContext context) =>
            UserBloc(UserRepository("${UrlConst.baseUrl}/user"))
              ..add(FetchUserInfo()),
        child: const AccountPage()),
  ];
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              RouteGenerator.loginRoute, (route) => false);
        }
      },
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: AppLocalizations.of(context)!.home),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.schedule), label: "Schedule"),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.menu_book),
                  label: AppLocalizations.of(context)!.course),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: AppLocalizations.of(context)!.account),
            ],
            currentIndex: _selectedIndex,
            onTap: _onTapBottomNavigation,
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: listPages,
          ),
        ),
      ),
    );
  }

  void _onTapBottomNavigation(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(_selectedIndex);
    });
  }
}
