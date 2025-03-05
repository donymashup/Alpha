import 'package:flutter/material.dart';

class AppConstant {
  static const backgroundColor2 = Color.fromARGB(255, 250, 246, 247);
  static const primaryColor = Color(0xFFD70000);
  static const lightGradient = Color.fromARGB(255, 214, 63, 69);
  static const darkGradient = Color.fromARGB(255, 138, 3, 3);
  static const cardBackground = Colors.white;
  static const strokeColor = Color.fromARGB(255, 207, 207, 207);
  static const hindColor = Color.fromARGB(255, 112, 112, 112);
  static const primaryColor2 = Color.fromARGB(255, 239, 32, 40);
  static const primaryColor3 = Color(0xFF323592);
  static const titlecolor = Color(0xFF000000); // Correct black color
  static const subtitlecolor = Color(0xFF989EA7);
  static const shadowColor = Color.fromARGB(255, 202, 188, 188);
  static const buttonupdate = Color(0xFFF6921E);
  static const backgroundColor = Color.fromARGB(255, 247, 246, 250);
  static const notificationbackground = Color.fromARGB(255, 230, 225, 225);

  // Dots colors
  static const reddot = Color.fromARGB(255, 239, 32, 40);
  static const orangedot = Color(0xFFFFA500);
  static const bluedot = Color(0xFF005DA3);
  static const yellowdot = Color(0xFFFFD700);

  static const OPENAI_API_KEY = " ";

  //

  static const Gradient redWhiteGradient = LinearGradient(
    colors: [AppConstant.backgroundColor, Color(0xFFF8A2A5)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient redDarkeGradient = LinearGradient(
    colors: [primaryColor, darkGradient],
    begin: Alignment.topLeft,
    end: Alignment.topRight,
  );

static const Gradient blueDarkeGradient = LinearGradient(
    colors: [Color.fromARGB(255, 0, 68, 215), Color.fromARGB(255, 83, 2, 154)],
    begin: Alignment.topLeft,
    end: Alignment.topRight,
  );


  static const List<String> carouselImages = [
    //'assets/images/alphalogo.png',
    'assets/images/etutorslider5.png',
    'assets/images/banner1.png',
    'assets/images/banner3.png',
    'assets/images/banner4.png',
  ];

  static const List<String> items = [
    "All Courses",
    "NEET",
    "JEE",
    "UPSC",
    "PSC",
    "SSC"
  ];

  static const List<Map<String, dynamic>> item = [
    {
      "title": "Bumper Olympiard",
      "imagePath": "assets/images/course1.png",
      "rating": 4.5,
    },
    {
      "title": "USS",
      "imagePath": "assets/images/course2.png",
      "rating": 4.8,
    },
    {
      "title": "NMMS",
      "imagePath": "assets/images/course3.png",
      "rating": 4.2,
    },
  ];
}
