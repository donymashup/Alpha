import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/selected_course_controller.dart';
import 'package:alpha/models/available_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';

class OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CourseDetails? courseDetails = Get.find<CourseController>().selectedCourse.value;
    final description = courseDetails?.description ?? "No description available";
    print(description);

    return Expanded(
      child: Card(
        color: AppConstant.cardBackground,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Html(
              data: description,  // Directly rendering HTML content
              style: {
                "p": Style(fontSize: FontSize.medium),
                "h3": Style(fontSize: FontSize.large, fontWeight: FontWeight.bold),
              },
            ),
          ),
        ),
      ),
    );
  }
}
