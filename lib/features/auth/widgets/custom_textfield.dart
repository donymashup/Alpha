// 

import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool isPassword;
  final TextEditingController? Controller;


  const CustomTextField({
    required this.labelText,
    required this.hintText,
    this.isPassword = false,
    this.Controller,
    super.key,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true; // Default to obscured text for password fields

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.Controller,
      obscureText: widget.isPassword ? _isObscured : false, // Conditionally obscure text
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: AppConstant.strokeColor,
          ),
        ),

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null, 
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "${widget.labelText} is required";
        }

        // Email validation
        if (widget.labelText == "Email") {
          final emailRegex =RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
          if (!emailRegex.hasMatch(value)) {
            return "Enter a valid email";
          }
        }

        // Password validation (Minimum 6 characters)
        if (widget.labelText == "Password") {
          if (value.length < 6) {
            return "Password must be at least 6 characters";
          }
        }

        // Phone Number validation (10 digits)
        if (widget.labelText == "Phone Number") {
          final phoneRegex = RegExp(r'^[0-9]{10}$');
          if (!phoneRegex.hasMatch(value)) {
            return "Enter a valid 10-digit phone number";
          }
        }

        return null; // Return null if no validation errors
      },
    );
  }
}
