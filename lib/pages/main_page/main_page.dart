import 'package:flutter/material.dart';
import 'package:lettutor/common_widget/change_locale_widget.dart';
import 'package:lettutor/pages/account_page/account_page.dart';
import 'package:lettutor/pages/course_page/course_page.dart';
import 'package:lettutor/pages/home_page/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/pages/schedule_page/schedule_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> listPages = [
    const HomePage(),
    const SchedulePage(),
    const CoursePage(),
    const AccountPage(),
  ];

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
            BottomNavigationBarItem(
                icon: const Icon(Icons.schedule),
                label: "Schedule"),
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
        body: Stack(
          children: [
            IndexedStack(
              index: _selectedIndex,
              children: listPages,
            ),
            const Positioned(
              right: 0,
              child: ChangeLocaleWidget(),
            )
          ],
        ),
      ),
    );
  }

  void _onTapBottomNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
