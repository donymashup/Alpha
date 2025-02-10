import 'dart:convert';

import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:alpha/constants/config.dart';
import 'package:alpha/constants/utils.dart';
import 'package:alpha/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CustomBottomNavigation()));
            
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
}