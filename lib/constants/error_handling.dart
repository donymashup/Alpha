import 'dart:convert';

import 'package:alpha/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(response.body)['msg']);
      print('1');
      break;
    case 500:
      showSnackbar(context, jsonDecode(response.body)['error']);
      print(jsonDecode(response.body)['error']);
      break;
    default:
      showSnackbar(context, response.body);
  }
}
