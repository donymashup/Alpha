import 'package:alpha/features/auth/screen/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:alpha/constants/app_constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppConstant.backgroundColor,
        ),
        child: Stack(
          children: [
            // Background dots
            const colorDot(top: 30.0, right: -40.0, width: 150.0, height: 150.0, Color: AppConstant.bluedot),
            const colorDot(top: 20.0, left: -20.0, width: 100.0, height: 100.0, Color: AppConstant.orangedot),
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

            // Main Content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // Image
                Center(
                  child: Image.asset(
                    'assets/images/woman.png',
                    height: 350.0,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),

                // Page Indicator Dots
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

                // Title
                const Text(
                  'Welcome To Alpha',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),

                // Subtitle
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

                // Swipeable Button
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: SwipeableButtonView(
                    buttonText: 'Login with Phone',
                    buttonWidget: const Icon(
                      Icons.phone,
                      color: AppConstant.primaryColor3,
                    ),
                    activeColor: AppConstant.primaryColor2,
                    isFinished: isFinished,
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          isFinished = true;
                        });
                      });
                    },
                    onFinish: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneNumberVerificationPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 50),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
