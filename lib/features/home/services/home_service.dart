
import 'dart:convert';
import 'package:alpha/constants/utils.dart';
import 'package:alpha/models/available_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeService {
  // Get available courses
  Future<AvailableCoursesModel?> getAvailableCourses({
    required BuildContext context,
  }) async {
    try {
      // Retrieve userId from SharedPreferences (Uncomment if needed)
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? userId = prefs.getString('userId') ?? '1'; // Default to '1' if null

      var headers = {
        'Cookie': 'etcpro_ci_session=18sjlpb9r1jqtr68p77nfo77ds8qpd2a'
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('https://demo.etcweb.in/api/getAvailableCourses'));
      request.fields.addAll({'userid': '1'});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);

        // Validate jsonResponse structure
        if (jsonResponse == null || jsonResponse.isEmpty) {
          showSnackbar(context, 'Invalid response from server');
          return null;
        }

        var availableCoursesModel = AvailableCoursesModel.fromJson(jsonResponse);

        if (availableCoursesModel.type == 'success') {
          showSnackbar(context, 'Course fetch success');

          // Safely check if courses list is not null or empty before accessing
          if (availableCoursesModel.courses != null &&
              availableCoursesModel.courses!.isNotEmpty) {
            print("Data received: ${availableCoursesModel.courses![0].courseDetails?.name}");
          } else {
            print("No courses available.");
          }

          return availableCoursesModel;
        } else {
          showSnackbar(context, 'Course fetch failed');
          return null;
        }
      } else {
        print("Failed to fetch courses: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      showSnackbar(context, "Error fetching courses: $e");
      print("Exception: $e");
      return null;
    }
  }
}
