import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/phone_number.dart'; // Import the login screen

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButton({
    required this.onPressed,

   Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.width * 0.9,50),
        backgroundColor: AppConstant.lightGradient, // Set the background color of the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),// Optional: rounded corners
        ),

      ),
      child: const Text(
        'Register',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),
      ),
    );
  }
}