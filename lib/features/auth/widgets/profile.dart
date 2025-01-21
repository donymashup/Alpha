import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/widgets/edit_pen.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.15,
      left: 0,
      right: 0,
      child: const Stack(
        alignment: Alignment.center, // Aligns the children at the center
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          EditPen(),
        ],
      ),
    );
  }
}

