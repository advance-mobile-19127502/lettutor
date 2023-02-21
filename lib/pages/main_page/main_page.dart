

import 'package:flutter/material.dart';
import 'package:lettutor/pages/course_page/course_page.dart';
import 'package:lettutor/pages/home_page/home_page.dart';
import 'package:lettutor/pages/profile_page/profile_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  List<Widget> listPages = [
    HomePage(),
    CoursePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
          currentIndex: _selectedIndex,
          onTap: _onTapBottomNavigation,
        ),
        body: IndexedStack(
          children: listPages,
          index: _selectedIndex,
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

