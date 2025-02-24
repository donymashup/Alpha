import 'dart:convert';

import 'package:alpha/constants/utils.dart';
import 'package:alpha/models/user_subscriptions_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserSubscriptionsServices {
  Future<UserSubscriptionsModel?>getUserSubscriptions({
    required BuildContext context,

    
  })async{
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      var headers = {
  'Cookie': 'etcpro_ci_session=ldne7shd0rend0pvghas0psrs1liid4i'
};
var request = http.MultipartRequest('POST', Uri.parse('https://demo.etcweb.in/api/getUserSubscriptions'));
request.fields.addAll({
  'userid': '1'
});

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();
if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      var userSubscriptionsModel = UserSubscriptionsModel.fromJson(jsonResponse);

      if (userSubscriptionsModel.type == 'success') {
              showSnackbar(
                  context, userSubscriptionsModel.message!);
            } else {
              showSnackbar(
                  context, userSubscriptionsModel.message!);
            }      
      
     return userSubscriptionsModel;
    } else {
      print("Failed to fetch subcribed courses: ${response.statusCode}");
      return null;
    }


    }catch(e){
      print(e);
    }
  }
}