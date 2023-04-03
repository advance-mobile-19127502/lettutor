import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/auth_bloc/auth_bloc.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/common_widget/change_locale_widget.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/pages/account_page/account_page.dart';
import 'package:lettutor/pages/course_page/course_page.dart';
import 'package:lettutor/pages/home_page/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/pages/schedule_page/schedule_page.dart';
import 'package:lettutor/repositories/tutor_repository.dart';
import 'package:lettutor/repositories/user_repository.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> listPages = [
    BlocProvider(
        create: (context) => ListTutorBloc(
            TutorRepository("${UrlConst.baseUrl}/tutor"),
            UserRepository("${UrlConst.baseUrl}/user"))
          ..add(const FetchListTutorEvent(10)),
        child: const HomePage()),
    const SchedulePage(),
    const CoursePage(),
    const AccountPage(),
  ];
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }

  void _onTapBottomNavigation(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(_selectedIndex);
    });
  }
}
