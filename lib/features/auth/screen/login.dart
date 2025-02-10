import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/services/login_service.dart';
import 'package:alpha/features/auth/widgets/custom_elavatedbutton.dart';
import 'package:alpha/features/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String? phoneNumber;
  String? countryCode;
  final TextEditingController passwordController = TextEditingController();

 void login() {
  AuthService().loginUser(
    phone: phoneNumber ?? '',  
    code: countryCode ?? '',  
    password: passwordController.text, 
    context: context,
  );
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:AppConstant.backgroundColor ,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppConstant.backgroundColor,
        elevation: 0,
      ),
      body: SizedBox(
        
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                // const Text(
                //   "We'll need your phone number to send an\nOTP for verification.",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Colors.grey,
                //     height: 1.5,
                //   ),
                // ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
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
                    child: Column(
                      children: [
                        IntlPhoneField(
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
                          initialCountryCode: 'IN',
                          keyboardType: TextInputType.phone,
                          onChanged: (phone) {
                            setState(() {
                              //phoneNumber = phone.completeNumber;
                               countryCode = phone.countryCode;
                               phoneNumber = phone.number;
                            });
                          },
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(labelText: "Password", hintText: "Enter your password", isPassword: true,Controller: passwordController,),

                      ],
                    ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: CustomElavatedButton(
                    text: 'Login',
                    onPressed: () {
                     login();
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}