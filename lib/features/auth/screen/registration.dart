import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/widgets/wave_clipper.dart';
import 'package:flutter/material.dart';



class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Opacity(opacity:0.5,
            child:wave_widget(),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                color: AppConstant.primaryColor,
              ),
            ), 
          ],
        ),
      )
    );
  }
}


class wave_widget extends StatelessWidget {
  const wave_widget({
    
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: AppConstant.primaryColor,
      ),
    );
  }
}