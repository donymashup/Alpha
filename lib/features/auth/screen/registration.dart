import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/widgets/custom_buttom.dart';
import 'package:alpha/features/auth/widgets/custom_textfield.dart';
import 'package:alpha/features/auth/widgets/profile.dart';
import 'package:alpha/features/auth/widgets/wave_clipper.dart';
import 'package:alpha/features/auth/widgets/wave_widget.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: wave_widget(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                wave_widget(
                  height: MediaQuery.of(context).size.height * 0.325,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 0,
                  right: 0,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Center(
                      child: Text(
                        'WE WOULD LIKE TO KNOW MORE ABOUT YOU',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppConstant.cardBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                profile(),
              ],
            ),
          
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(labelText:"First Name" ,hintText: "Enter your first name",),
                    const SizedBox(height: 17),
                    CustomTextField(labelText:"Last Name" ,hintText: "Enter your last name",),
                    const SizedBox(height: 17),
                    CustomTextField(labelText:"Email id" ,hintText: "Enter your email id",),
                    const SizedBox(height: 17),
                    CustomTextField(labelText:"Password" ,hintText: "Enter your password",isPassword: true),
                    const SizedBox(height: 17),
                    CustomTextField(labelText:"Select your class" ,hintText: "class 5",),
                    const SizedBox(height: 17),
                    CustomTextField(labelText:"School Name" ,hintText: "Enter your school name",),
                    const SizedBox(height: 17),
                    CustomTextField(labelText:"Phone Number" ,hintText : "",),
                    
                    const SizedBox(height: 30),
                    Center(
                      child: CustomButtom(),
                      

                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}