//import 'package:alpha/common%20widgets/side_menu.dart';
import 'package:alpha/bindings/app_bindings.dart';
import 'package:alpha/common%20widgets/splash_screen.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_tex/flutter_tex.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TeXRederingServer.renderingEngine = const TeXViewRenderingEngine.mathjax();

  // if (!kIsWeb) {
  //   await TeXRederingServer.run();
  //   await TeXRederingServer.initController();
  // }

  // Check if user is logged in
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
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
      home: isLoggedIn ? CustomBottomNavigation() : SplashScreen(),
    );
  }
}
