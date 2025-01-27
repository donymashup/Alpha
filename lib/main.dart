import 'package:alpha/common%20widgets/splash_screen.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/login.dart';

import 'package:alpha/features/auth/screen/otp_screen.dart';

import 'package:alpha/features/auth/screen/registration.dart';

import 'package:alpha/features/home/screen/home_screen.dart';

import 'package:alpha/features/auth/widgets/bottom_navigation_bar.dart';
import 'package:alpha/features/my_courses/screens/course_detail.dart';
import 'package:alpha/features/timeline/calendar_schedule_page.dart';
import 'package:flutter/material.dart';


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

     // home: AnimatedTabBarScreen(),
      home: SplashScreen(),

    );
  }
}
