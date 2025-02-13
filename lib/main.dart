//import 'package:alpha/common%20widgets/side_menu.dart';
import 'package:alpha/bindings/app_bindings.dart';
import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:alpha/constants/app_constants.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
     runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstant.primaryColor),
        useMaterial3: true,
      ),
      initialBinding: AppBindings(), 
      home: CustomBottomNavigation(),

    );
  }
}
