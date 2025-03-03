import 'dart:convert';
import 'package:alpha/constants/config.dart';
import 'package:alpha/constants/utils.dart';
import 'package:alpha/models/course_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetailsService {
  Future<CourseDetailsModel?> getCourseDetails({
    required BuildContext context,
    required String courseId,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('userId');

      final response = await _sendPostRequest(
        url: '$baseUrl$courseDetailsUrl',
        fields: {
          'userid': userId!,
          'courseid': courseId,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(await response.stream.bytesToString());
        if (jsonResponse == null || jsonResponse.isEmpty) {
          showSnackbar(context, 'Invalid response from server');
          return null;
        }

        final courseDetailsModel = CourseDetailsModel.fromJson(jsonResponse);

        if (courseDetailsModel.type == 'success') {
          showSnackbar(context, 'Course details fetch success');
          return courseDetailsModel;
        } else {
          showSnackbar(context, 'Course details fetch failed');
          return null;
        }
      } else {
        print("Failed to fetch course details: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      showSnackbar(context, "Error fetching course details: $e");
      print("Exception: $e");
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
}
