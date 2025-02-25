import 'dart:convert';

import 'package:alpha/constants/config.dart';
import 'package:alpha/constants/utils.dart';
import 'package:alpha/models/chapter_list_model.dart';
import 'package:alpha/models/classs_list_model.dart';
import 'package:alpha/models/material_model.dart';
import 'package:alpha/models/practice_test_model.dart';
import 'package:alpha/models/subject_list_model.dart';
import 'package:alpha/models/user_subscriptions_model.dart';
import 'package:alpha/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserSubscriptionsServices {
  Future<UserSubscriptionsModel?> getUserSubscriptions({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      var headers = {
        'Cookie': 'etcpro_ci_session=ldne7shd0rend0pvghas0psrs1liid4i'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrlEtc$userSubscriptions'));
      request.fields.addAll({
        'userid': '1',
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        var userSubscriptionsModel =
            UserSubscriptionsModel.fromJson(jsonResponse);

        if (userSubscriptionsModel.type == 'success') {
          showSnackbar(context, userSubscriptionsModel.message!);
        } else {
          showSnackbar(context, userSubscriptionsModel.message!);
        }

        return userSubscriptionsModel;
      } else {
        print("Failed to fetch subcribed courses: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  // function to get list of classes
  Future<ClassListModel?> getClassList({
    required BuildContext context,
    required String courseId,
  }) async {
    try {
      var headers = {
        'Cookie': 'etcpro_ci_session=ob1j1bqivdkr2vbj2decv60nur71v7tm'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrlEtc$classList'));
      request.fields.addAll({
        'courseid': courseId,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        var classListModel = ClassListModel.fromJson(jsonResponse);
        if (classListModel.type == 'success') {
          showSnackbar(context, "class list fetched successfully");
        } else {
          showSnackbar(context, "Failed to fetch class list");
        }

        return classListModel;
      } else {
        print("Failed to fetch class list ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  // function to get list of subjects
  Future<SubjectListModel?> getCourseSubjectList({
    required BuildContext context,
    required String classId,
    required String packageId,
    required String batchId,
  }) async {
    try {
      var headers = {
        'Cookie': 'etcpro_ci_session=r0du05sqftbu48n8q9avbj8ojhl156r6'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrlEtc$subjectList'));
      request.fields.addAll({
        'classid': classId,
        'batchid': batchId,
        'packageid': packageId,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        var subjectListModel = SubjectListModel.fromJson(jsonResponse);
        if (subjectListModel.type == 'success') {
          showSnackbar(context, "subject list fetched successfully");
        } else {
          showSnackbar(context, "Failed to fetch subject list");
        }

        return subjectListModel;
      } else {
        print("Failed to fetch subject list ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  // function to get list of chapters
  Future<ChapterListModel?> getSubjectChapterList({
    required BuildContext context,
    required String classId,
    required String subjectId,
    required String packageId,
    required String batchId,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      var headers = {
        'Cookie': 'etcpro_ci_session=nrh4r46j6es8v2uqfsm2hd1l7h6f26fc'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrlEtc$chapterList'));
      request.fields.addAll({
        'classid': classId,
        'batchid': batchId,
        'packageid': packageId,
        'subjectid': subjectId,
        'userid': '1',
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        var chapterListModel = ChapterListModel.fromJson(jsonResponse);
        if (chapterListModel.type == 'success') {
          showSnackbar(context, "chapter list fetched successfully");
        } else {
          showSnackbar(context, "Failed to fetch chapter list");
        }

        return chapterListModel;
      } else {
        print("Failed to fetch chapter list ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  // function to get list of videos
  Future<VideoModel?> getChapterVideos({
    required BuildContext context,
    required String chapterId,
    required String batchId,
    required String packageId,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      var headers = {
        'Cookie': 'etcpro_ci_session=u44h10b21a2v8ku1cssq9306ossm2f3a'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrlEtc$videoList'));
      request.fields.addAll({
        'chapterid': chapterId,
        'batchid': batchId,
        'packageid': packageId,
        'userid': '1'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        var videoModel = VideoModel.fromJson(jsonResponse);
        if (videoModel.type == 'success') {
          showSnackbar(context, "video list fetched successfully");
        } else {
          showSnackbar(context, "Failed to fetch video list");
        }

        return videoModel;
      } else {
        print("Failed to fetch video list ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  // function to get list of materials
  Future<MaterialsModel?> getChapterMaterials({
    required BuildContext context,
    required String chapterId,
    required String batchId,
    required String packageId,
  }) async{
    try{
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
     var headers = {
        'Cookie': 'etcpro_ci_session=9c5renlsoc6vbro88194ljf19mauq56u'
      };
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrlEtc$materialList'));
      request.fields.addAll({
        'chapterid': chapterId,
        'batchid': batchId,
        'packageid': packageId,
        'userid': '1'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        var materialsModel = MaterialsModel.fromJson(jsonResponse);
        if (materialsModel.type == 'success') {
          showSnackbar(context, "materials list fetched successfully");
        } else {
          showSnackbar(context, "Failed to fetch materials list");
        }
        return materialsModel;
      } else {
        print("Failed to fetch materials list ${response.statusCode}");
        return null;
      }
    }catch(e){
      print(e);
    }
  }

  // function to get list of practice tests
  Future<PracticeTestModel?> getChapterPracticeTests({
    required BuildContext context,
    required String chapterId,
    required String batchId,
    required String packageId,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userId = pref.getString('userId');
      var headers = {
        'Cookie': 'etcpro_ci_session=9c5renlsoc6vbro88194ljf19mauq56u'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrlEtc$practiceTestList'));
      request.fields.addAll({
        'chapterid': chapterId,
        'batchid': batchId,
        'packageid': packageId,
        'userid': '1'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        var practiceTestModel = PracticeTestModel.fromJson(jsonResponse);
        if (practiceTestModel.type == 'success') {
          showSnackbar(context, "practice test list fetched successfully");
        } else {
          showSnackbar(context, "Failed to fetch practice test list");
        }

        return practiceTestModel;
      } else {
        print("Failed to fetch practice test list ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
