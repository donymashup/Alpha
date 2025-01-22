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
          color: AppConstant.backgroundColor
        ),
        child: Stack(
          children: [
            // Background dots
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.withOpacity(0.8),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 70,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.8),
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 350,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 2,
              left: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 243, 33, 191).withOpacity(0.8),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 2 - 50,
              right: 40,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 3, 244, 19),
                ),
              ),
            ),
            // Main content
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                      child: Image.asset(
                        'assets/images/woman.png',
                        height: 500,
                      ),
                    ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: AppConstant.backgroundColor,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            widget.totalPages,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: widget.currentIndex == index ? 12 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: widget.currentIndex == index ? Colors.blue : Colors.grey,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}