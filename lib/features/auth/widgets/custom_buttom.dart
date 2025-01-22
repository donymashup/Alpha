import 'package:flutter/material.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/login.dart'; // Import the login screen

class CustomButton extends StatelessWidget {
  //final VoidCallback onPressed;

  const CustomButton({
    //required this.onPressed,

   Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PhoneNumberVerificationPage()) // Navigate to the login screen
        );
      },

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