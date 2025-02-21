import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alpha/constants/utils.dart';
import 'package:alpha/models/notification_model.dart';

class NotificationServices {
  Future<NotificationModel?> getNotifications({
    required String userId,
    required BuildContext context,
  }) async {
    try {
      var headers = {
        'Cookie': 'etcpro_ci_session=tbvpvdperrksodgemnn61qdngf5s7v1h'
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://demo.etcweb.in/api/getNotifications'),
      );

      request.fields['userid'] = userId;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        return NotificationModel.fromJson(json.decode(responseBody));
      } else {
        showSnackbar(context, "Failed to fetch notifications: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      showSnackbar(context, "Error fetching notifications: $e");
      return null;
    }
  }
}
