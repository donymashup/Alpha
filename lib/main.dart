import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/is_subscribed_controller.dart';
import 'package:alpha/features/auth/screen/login.dart';
import 'package:alpha/features/course_detailed/screens/course_detail.dart';
import 'package:alpha/features/home/screen/home_screen.dart';
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

     home:login(),

    );
  }
}
