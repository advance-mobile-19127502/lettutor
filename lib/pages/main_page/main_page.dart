

import 'package:flutter/material.dart';
import 'package:lettutor/pages/account_page/account_page.dart';
import 'package:lettutor/pages/course_page/course_page.dart';
import 'package:lettutor/pages/home_page/home_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> listPages = [
    const HomePage(),
    const CoursePage(),
    const AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Course"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onTapBottomNavigation,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: listPages,
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

