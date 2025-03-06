import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/login.dart';
import 'package:alpha/features/auth/services/login_service.dart';
import 'package:alpha/features/subscribed_courses/screen/my_courses.dart';
import 'package:alpha/features/live/screen/live_courses.dart';
import 'package:alpha/features/test_series/screens/test_series.dart';
import 'package:alpha/models/user_details_model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:alpha/features/home/screen/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  bool isLoading = true;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
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
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchUserDetails();
  }

  /// Fetch user details from API and update UI
  Future<void> fetchUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");

    if (userId != null) {
      UserDetailsModel? details = await AuthService()
          .getUserDetails(
        userId: userId,
        context: context,
      )
          .then((value) {
        if (!mounted) return null;
        setState(() => isLoading = false);
        return value;
      }).catchError((error) {
        // Handle error, e.g., logout
        AuthService().logout(context);
      });
    } else {
      print("User ID not found in SharedPreferences");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: AppConstant.backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            gap: 8,
            activeColor: AppConstant.primaryColor2,
            color: Colors.grey,
            backgroundColor: AppConstant.backgroundColor,
            tabBackgroundColor: AppConstant.primaryColor2.withAlpha(50),
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
                icon: FluentIcons.clipboard_task_list_16_regular,
                text: 'Test Series',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
