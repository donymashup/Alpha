import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: () {
        // Handle form submission
      },
     style: ElevatedButton.styleFrom(
      minimumSize: Size( MediaQuery.of(context).size.width * 0.7, 50),
      backgroundColor: AppConstant.primaryColor2, // Set the background color of the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Optional: rounded corners
      ),
    ),
      child: const Text('Register',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

