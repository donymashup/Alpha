import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/courses/my_courses.dart';
import 'package:alpha/features/live/screen/live_courses.dart';
import 'package:alpha/features/profile/my_profile.dart';
import 'package:alpha/features/test_series/test_series.dart';
import 'package:alpha/features/timeline/calendar_schedule_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:alpha/features/home/screen/home_screen.dart'; // Import HomeScreen
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    MyCourses(),
    const LiveClassesScreen(),
    TestSeriesScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: AppConstant.backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 08),
        child: GNav(
          gap: 8,
          activeColor: AppConstant.primaryColor2,
          color: Colors.grey,
          backgroundColor: AppConstant.backgroundColor,
          tabBackgroundColor: AppConstant.primaryColor2.withOpacity(0.1),
          padding: const EdgeInsets.all(16),
          onTabChange: _onItemTapped,
          selectedIndex: _selectedIndex,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.school_outlined,
              text: 'My Courses',
            ),
            GButton(
              icon: Icons.live_tv,
              text: 'Live',
            ),
            // GButton(
            //   icon: Icons.person,
            //   text: 'Profile',
            // ),
            GButton(
              icon: FluentIcons.clipboard_task_list_16_regular, // Test Series Icon
              text: 'Test Series',
            ),
          ],
        ),
      ),
    );
  }
}