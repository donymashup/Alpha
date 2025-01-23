import 'package:flutter/material.dart';

class CustonImageButtom extends StatelessWidget {
  final dynamic path;
  const CustonImageButtom({
    required this.path,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        path, 
        height: 40,
        width: 40,
      ),
      onPressed: () {
        // Add your menu functionality here
      },
    );
  }
}