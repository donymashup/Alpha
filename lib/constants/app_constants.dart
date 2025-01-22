import 'package:flutter/material.dart';

class AppConstant {
  static const backgroundColor = Color.fromARGB(255, 250, 242, 243);
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


  // Dots colors
  static const reddot = Color.fromARGB(255, 239, 32, 40);
  static const orangedot = Color(0xFFFFA500);
  static const bluedot = Color(0xFF005DA3);
  static const yellowdot = Color(0xFFFFD700);


  //

  static const Gradient redWhiteGradient = LinearGradient(
    colors: [AppConstant.backgroundColor,Color(0xFFF8A2A5)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

