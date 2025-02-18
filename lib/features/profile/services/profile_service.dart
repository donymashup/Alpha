import 'dart:convert';

import 'package:alpha/constants/config.dart';
import 'package:alpha/constants/utils.dart';
import 'package:alpha/models/update_password_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  Future<UpdatePassword?> updatePassword({
    required String password,
    required BuildContext context,
  }) async {
   try{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
     var headers = {
     'Cookie': 'etcpro_ci_session=0icu4nas18rvknq5ah5rg8kfkrjdigvs'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrlEtc$updatePasswordUrl'));
    request.fields.addAll({
      'userid': userId ?? '',
      'password': password,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      var updatePassword = UpdatePassword.fromJson(jsonResponse);

      if (updatePassword.type == 'success') {
         showSnackbar(context, updatePassword.message ?? 'Password updated successfully');
      } else {
        showSnackbar(context, updatePassword.message ?? 'Failed to update password');
      }
 
      return updatePassword;
    } else {
      print("Failed to update password: ${response.statusCode}");
      return null;
    }

   }catch(e){
     print("Exception: $e");
   }


  }
}