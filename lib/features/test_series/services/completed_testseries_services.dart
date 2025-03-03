import 'package:alpha/models/completed_testseries_model.dart';
import 'package:alpha/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class CompletedTestseriesServices {
  Future<AttendedTestsModel?> getAttendedTests({
    required String userId,
    required BuildContext context,
  }) async {
    try {
      var headers = {
        'Cookie': 'etcpro_ci_session=013c04eti6uq3djpum5srviphikb9a31'
      };

      var response = await http.post(
        Uri.parse('https://demo.etcweb.in/api/getAttendedTests'),
        headers: headers,
        body: {'userid': userId},
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return AttendedTestsModel.fromJson(jsonResponse);
      } else {
        showSnackbar(context, "Failed to fetch completed test series: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      showSnackbar(context, "Error fetching completed test series: $e");
      return null;
    }
  }
}
