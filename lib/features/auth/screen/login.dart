import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/services/login_service.dart';
import 'package:alpha/features/auth/widgets/custom_elavatedbutton.dart';
import 'package:alpha/features/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? phoneNumber;
  String? countryCode;
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> handleLogin() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    await AuthService().loginUser(
      phone: phoneNumber ?? '',
      code: countryCode ?? '',
      password: passwordController.text,
      context: context,
    );

    setState(() {
      _isLoading = false; // Hide loading indicator
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppConstant.backgroundColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
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
                    const SizedBox(height: 8),
                    const Text(
                      'Please enter your phone number and\npassword to continue',
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
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 18),
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
                                countryCode = phone.countryCode;
                                phoneNumber = phone.number;
                              });
                            },
                          ),
                          const SizedBox(height: 5),
                          CustomTextField(
                            labelText: "Password",
                            hintText: "Enter your password",
                            isPassword: true,
                            Controller: passwordController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: CustomElavatedButton(
                        onPressed: _isLoading ? null : handleLogin,
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 100), // Extra space before gradient
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200, // Gradient height
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
