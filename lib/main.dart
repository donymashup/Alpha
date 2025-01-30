
//import 'package:alpha/common%20widgets/side_menu.dart';
import 'package:alpha/common%20widgets/splash_screen.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/login.dart';
import 'package:alpha/features/auth/screen/otp_screen.dart';
import 'package:alpha/features/auth/screen/registration.dart';
import 'package:alpha/features/courses/my_courses.dart';
import 'package:alpha/features/home/screen/home_screen.dart';
import 'package:alpha/features/auth/widgets/bottom_navigation_bar.dart';
import 'package:alpha/features/course_detailed/screens/course_detail.dart';
//import 'package:alpha/features/my_courses/widgets/rating.dart';
import 'package:alpha/features/course_detailed/widgets/reviews.dart';
import 'package:alpha/features/profile/my_profile.dart';
import 'package:alpha/features/timeline/calendar_schedule_page.dart';

import 'package:alpha/features/auth/widgets/bottom_navigation_bar.dart';
import 'package:alpha/features/home/screen/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:alpha/constants/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.primaryColor),
        useMaterial3: true,
      ),

<<<<<<< HEAD
      //home: HomeScreen(),
      //home: AnimatedTabBarScreen(),
      //home: SplashScreen(),
     // home: RatingScreen(),
     // home: ReviewScreen(),
        home: MyCourses(),
=======

      //home: HomeScreen(),
      //home: SplashScreen(),
     // home: RatingScreen(),
     // home: ReviewScreen(),
     home: CustomBottomNavigation(),
     

>>>>>>> c35b6b86626d47407a3a2a3d1f8bcca09bb8dc75
    );
  }
}
