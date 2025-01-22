import 'package:alpha/common%20widgets/color_dot.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/registration.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

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
    Future.delayed(Duration(seconds: 1), () {
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
        decoration: BoxDecoration(
          color: AppConstant.backgroundColor,
        ),
        child: Stack(
          children: [
            // Background dots
            const colorDot(top: -50, right: -50, width: 150, height: 150, Color: AppConstant.orangedot),
            const colorDot(top: 20, right: 70, width: 100, height: 100, Color: AppConstant.reddot),
            const colorDot(top: 150, right: 350, width: 30, height: 30, Color: AppConstant.bluedot),
            colorDot(top: MediaQuery.of(context).size.height / 2, right: -50, width: 150, height: 150, Color: AppConstant.bluedot),
            colorDot(top: MediaQuery.of(context).size.height / 2 - 50, right: 120, width: 40, height: 40, Color: Colors.lightBlue),

            // Main content inside SingleChildScrollView
            SingleChildScrollView(
              child: Column(
                children: [
                  // Image
                  Center(
                    child: Image.asset(
                      'assets/images/woman.png',
                      height: 500,
                    ),
                  ),
                  // Content below image
                  Container(
                    color: AppConstant.backgroundColor,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3, // Adjust the number of pages
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 12, // Adjust the size
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.blue, // Adjust color
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Welcome To Alpha',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'Learn something new everyday, Start your learning journey with Etutor.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SwipeableButtonView(
                              buttonText: 'Login with Phone',
                              buttonWidget: Container(
                                child: Icon(
                                  Icons.phone,
                                  color: AppConstant.primaryColor3,
                                ),
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
          ],
        ),
      ),
    );
  }
}

