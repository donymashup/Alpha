import 'dart:convert';
import 'package:alpha/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:alpha/models/upload_image_model.dart';

class ProfileService {
  final UserController userController = Get.put(UserController());
  Future<UploadImageModel?> uploadImage({
    required String userId,
    required String filePath,
    required BuildContext context,
  }) async {
    try {
      var headers = {
        'Cookie': 'etcpro_ci_session=p40kq6rqnph1qao8s1k91pj8hubeqc9n'
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse('https://demo.etcweb.in/api/uploadImage'));

      request.fields.addAll({'userid': userId});
      request.files.add(await http.MultipartFile.fromPath('file', filePath));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseData = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = jsonDecode(responseData);
        var uploadImageModel = UploadImageModel.fromJson(jsonResponse);
         String newImageUrl = uploadImageModel.imageUrl;
         userController.updateProfilePicture(newImageUrl);
        return uploadImageModel;
      } else {
        print('Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }
}
