// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/constants/config.dart';
import 'package:alpha/constants/utils.dart';
import 'package:alpha/models/login_model.dart';
import 'package:alpha/models/user_details_model.dart';
import 'package:alpha/features/auth/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Login user
  Future<LoginModel?> loginUser({
    required String phone,
    required String code,
    required String password,
    required BuildContext context,
  }) async {
    try {
      print('Phone: $phone, Code: $code, Password: $password');
      final response = await _sendPostRequest(
        url: "$baseUrl$loginUrl",
        fields: {'phone': phone, 'code': code, 'password': password},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(await response.stream.bytesToString());
        final loginModel = LoginModel.fromJson(jsonResponse);

        if (loginModel.type == 'success') {
          await _handleLoginSuccess(context, loginModel);
        } else {
          _showSnackbar(context, loginModel.message!);
        }

        return loginModel;
      } else {
        _handleError(context, 'Failed to login: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      _handleError(context, e.toString());
      return null;
    }
  }

  // Get user details
  Future<UserDetailsModel?> getUserDetails({
    required String userId,
    required BuildContext context,
  }) async {
    try {
      final response = await _sendPostRequest(
        url: '$baseUrl$userDetailsUrl',
        fields: {'userid': userId},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(await response.stream.bytesToString());
        final userDetailsModel = UserDetailsModel.fromJson(jsonResponse);

        if (userDetailsModel.type == 'success') {
          await _saveUserDetailsToPrefs(userDetailsModel);
          _showSnackbar(context, 'Data fetched');
        } else {
          _showSnackbar(context, 'Data fetching failed');
        }

        return userDetailsModel;
      } else {
        _handleError(context, 'Failed to fetch data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      _handleError(context, e.toString());
      return null;
    }
  }

  // Helper method to send POST request
  Future<http.StreamedResponse> _sendPostRequest({
    required String url,
    required Map<String, String> fields,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(fields);
    return await request.send();
  }

  // Handle login success
  Future<void> _handleLoginSuccess(
      BuildContext context, LoginModel loginModel) async {
    _showSnackbar(context, 'Login success');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', loginModel.userid!);
    await prefs.setBool('isLoggedIn', true); // Save login status
    final userId = prefs.getString('userId');
    if (userId != null) {
      await getUserDetails(userId: userId, context: context);
    }
  }

  // Handle error
  void _handleError(BuildContext context, String message) {
    _showSnackbar(context, message);
    print(message);
  }

  // Show snackbar
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Save user details to shared preferences
  Future<void> _saveUserDetailsToPrefs(
      UserDetailsModel userDetailsModel) async {
    final prefs = await SharedPreferences.getInstance();
    final user = userDetailsModel.user!;
    await prefs.setString("firstName", user.firstName!);
    await prefs.setString("lastName", user.lastName!);
    await prefs.setString("email", user.email!);
    await prefs.setString("phone", user.phone!);
    await prefs.setString("country", user.country!);
    await prefs.setString("dob", user.dob!);
    await prefs.setString("image", user.image!);
    await prefs.setString("address", user.address!);
    await prefs.setString("gender", user.gender!);
    await prefs.setString("school", user.school!);
    await prefs.setString("qualification", user.qualification!);

    userData.userid = userDetailsModel.user!.id.toString();
    userData.firstName = userDetailsModel.user!.firstName.toString();
    userData.lastName = userDetailsModel.user!.lastName.toString();
    userData.image = userDetailsModel.user!.image.toString();
    userData.email = userDetailsModel.user!.email.toString();
    userData.phone = userDetailsModel.user!.phone.toString();
    userData.country = userDetailsModel.user!.country.toString();
  }

  // Logout User and Clear Session
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored data
    userData.userid = '';
    userData.firstName = '';
    userData.lastName = '';
    userData.image = '';
    userData.email = '';
    userData.phone = '';
    userData.country = '';
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  // Check if User is Logged In
  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
