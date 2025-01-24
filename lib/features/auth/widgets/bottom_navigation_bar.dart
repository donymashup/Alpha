import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/live/screen/live_courses.dart';
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
    const Center(child: Text('My Courses Screen')),
    const LiveClassesScreen(),
    const Center(child: Text('Profile Screen')),
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
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}