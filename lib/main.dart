import 'package:alpha/bindings/app_bindings.dart';
import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

<<<<<<< Updated upstream
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if user is logged in
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
=======
void main() {
  runApp(const MyApp());
>>>>>>> Stashed changes
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

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
<<<<<<< Updated upstream
      home: isLoggedIn ? CustomBottomNavigation() : Login(),
=======
      // home:MyCourses(),
      home: SplashScreen(),
>>>>>>> Stashed changes
    );
  }
}
