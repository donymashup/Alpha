import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/otp_screen.dart';
import 'package:alpha/features/auth/widgets/custom_elavatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppConstant.backgroundColor, // Use the static backgroundColor
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: AppConstant.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Phone Number\nVerification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "We'll need your phone number to send an\nOTP for verification.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter phone number',
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      initialCountryCode: 'IN', // Default country code
                      onChanged: (phone) {
                        print(phone.completeNumber); // Handle phone number change
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: CustomElavatedButton(text:'Sent OTP' , onPressed: () {
                      // Navigate to the OTP verification page
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => OtpScreen()));
                    }),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200, // Adjust the height as needed
              decoration: BoxDecoration(
                gradient: AppConstant.redWhiteGradient,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

