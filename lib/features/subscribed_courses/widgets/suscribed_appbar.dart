import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/subscribed_courses/screen/class_list.dart';
import 'package:flutter/material.dart';

class SubscribedAppBar extends StatelessWidget {
  final String title;
  const SubscribedAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title, style: TextStyle(color: Colors.white,fontSize: 20)),
        backgroundColor: AppConstant.primaryColor,
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}