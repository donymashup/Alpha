import 'package:flutter/material.dart';

class colorDot extends StatelessWidget {
  final top;
  final right;
  final width;
  final height;
  final Color;
  const colorDot({
    required this.top,
    required this.right,
    required this.width,
    required this.height,
    required this.Color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color,
        ),
      ),
    );
  }
}

