import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/widgets/wave_clipper.dart';
import 'package:flutter/material.dart';

class wave_widget extends StatelessWidget {
  final dynamic height;

  const wave_widget({super.key, 
    this.height,
    });


  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: height,
        color: AppConstant.primaryColor,
      ),
    );
  }
}