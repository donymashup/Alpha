//import 'package:alpha/common%20widgets/side_menu.dart';
import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:alpha/common%20widgets/splash_screen.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/is_subscribed_controller.dart';
import 'package:alpha/features/auth/screen/login.dart';
import 'package:alpha/features/auth/screen/phone_number.dart';
//import 'package:alpha/features/my_courses/widgets/rating.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
   Get.put(IsSubscribedController());
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
    //  home: CustomBottomNavigation()

    // home: SplashScreen()


     home: Login(),

    );
  }
}
