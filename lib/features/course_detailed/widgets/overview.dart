import 'dart:convert';

import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/selected_course_controller.dart';
import 'package:alpha/models/available_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_tex/flutter_tex.dart';

class OverviewTab extends StatelessWidget {
  final String description;

  const OverviewTab({super.key, required this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppConstant.cardBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: HtmlWidget(description),
          ),
        ),
      ),
    );
  }
}
