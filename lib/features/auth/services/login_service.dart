// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:alpha/constants/config.dart';
import 'package:alpha/constants/utils.dart';
import 'package:alpha/models/login_model.dart';
import 'package:alpha/models/user_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //login user
   Future<LoginModel?> loginUser({
    required String phone,
    required String code,
    required String password,
    required BuildContext context
   }) async {
   try{
      var headers = {
        'Cookie': 'alpha_pro_ci_session=v6lilv2rhuq62rabq8vaomcf1uiag1kc'
      };
      var request = http.MultipartRequest('POST', Uri.parse("$baseUrl$loginUrl"));
      request.fields.addAll({
        'phone': phone,
        'code': code,
        'password': password
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      
      if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      var loginModel = LoginModel.fromJson(jsonResponse);

      if (loginModel.type == 'success') {
              showSnackbar(
                  context, 'login success');
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('userId', loginModel.userid!);
                  String? userId = prefs.getString('userId');
                  AuthService().getUserDetails(   
                    userId: userId ?? '',
                    context: context,
                  );

            } else {
              showSnackbar(
                  context, 'login failed');
            }      
      
      return LoginModel.fromJson(jsonResponse);
    } else {
      print("Failed to login: ${response.statusCode}");
      return null;
    }
   }catch (e) {
      showSnackbar(
        context,
        e.toString(),
      );
    }
    
   }

  //user details
  Future<UserDetailsModel?> getUserDetails({
    required String userId,
    required BuildContext context
  }) async {
    try{
          var headers = {'Cookie': 'alpha_pro_ci_session=r7embt3to5f1c0rcfnim9f4md3nj7qat'};
          var request = http.MultipartRequest('POST', Uri.parse('https://alphaacademyonline.in/api/getUserDetails'));
          request.fields.addAll({
            'userid': userId
          });

          request.headers.addAll(headers);
          http.StreamedResponse response = await request.send();

          if (response.statusCode == 200) {
                  var responseBody = await response.stream.bytesToString();
                  final jsonResponse = json.decode(responseBody);
                  var userDetailsModel = UserDetailsModel.fromJson(jsonResponse);

                  if (userDetailsModel.type == 'success') {
                          showSnackbar(context,'data fetched');

                          //print('data fetched');

                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           await prefs.setString("firstName", userDetailsModel.user!.firstName!);
                            await prefs.setString("lastName", userDetailsModel.user!.lastName!);
                            await prefs.setString("email", userDetailsModel.user!.email!);
                            await prefs.setString("phone", userDetailsModel.user!.phone!);
                            await prefs.setString("country", userDetailsModel.user!.country!);
                            await prefs.setString("dob", userDetailsModel.user!.dob!);
                            await prefs.setString("image", userDetailsModel.user!.image!);
                            await prefs.setString("address", userDetailsModel.user!.address!);
                            await prefs.setString("gender", userDetailsModel.user!.gender!);
                            await prefs.setString("school", userDetailsModel.user!.school!);
                            await prefs.setString("qualification", userDetailsModel.user!.qualification!);
                            // String? firstName = prefs.getString('firstName');
                            // String? lastName = prefs.getString('lastName');
                            // String? email = prefs.getString('email');
                            // String? phone = prefs.getString('phone');
                            // String? country = prefs.getString('country');
                            // String? dob = prefs.getString('dob');
                            // String? image = prefs.getString('image');
                            // String? address = prefs.getString('address');
                            // String? school = prefs.getString('school'); 
                            // String? qualification = prefs.getString('qualification');

                            // print(firstName);
                            // print(lastName);  
                            // print(email);
                            // print(phone);
                            // print(country);
                            // print(dob);
                            // print(image);
                            // print(address);
                            // print(school);
                            // print(qualification);


                              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBottomNavigation()));
                        } else {
                          showSnackbar( context, 'data fetching failed');
                        }      
                  
               return UserDetailsModel.fromJson(jsonResponse);
    }else {
      print("Failed to fetch data: ${response.statusCode}");
      return null;
    }
    }catch(e){
      showSnackbar(
        context,
        e.toString(),
      );
    }
  }
    
}