import 'package:flutter/material.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/registration.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:alpha/common%20widgets/color_dot.dart';

class WelcomePage extends StatefulWidget {
  final int currentIndex;
  final int totalPages;

  const WelcomePage({
    required this.currentIndex,
    required this.totalPages,
    Key? key,
  }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isFinished = false;

  void onSwipeComplete() {
    setState(() {
      isFinished = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppConstant.backgroundColor,
        ),
        child: Stack(
          children: [
            // Background dots
            const colorDot(top: 30.0, right: -40.0, width: 150.0, height: 150.0, Color: AppConstant.bluedot),
            const colorDot(top: 20.0, right: 420.0, width: 100.0, height: 100.0, Color: AppConstant.orangedot),
            const colorDot(top: 150.0, right: 350.0, width: 30.0, height: 30.0, Color: AppConstant.bluedot),
            colorDot(
              top: MediaQuery.of(context).size.height / 3,
              right: 220.0,
              width: 150.0,
              height: 150.0,
              Color: AppConstant.reddot,
            ),
            colorDot(
              top: MediaQuery.of(context).size.height / 2,
              right: 80.0,
              width: 20.0,
              height: 20.0,
              Color: Colors.lightBlue,
            ),

            // Main content inside SingleChildScrollView
            SingleChildScrollView(
              child: Column(
                children: [
                  // Image
                  Center(
                    child: Image.asset(
                      'assets/images/woman.png',
                      height: 720.0,
                    ),
                  ),
                  // Content below image
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.totalPages,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: widget.currentIndex == index ? 12.0 : 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: widget.currentIndex == index ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Welcome To Etutor',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'Learn something new every day. Start your learning journey with Etutor.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SwipeableButtonView(
                      buttonText: 'Login with Phone',
                      buttonWidget: const Icon(
                        Icons.phone,
                        color: AppConstant.primaryColor3,
                      ),
                      activeColor: AppConstant.primaryColor2,
                      isFinished: isFinished,
                      onWaitingProcess: onSwipeComplete,
                      onFinish: onSwipeComplete,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}