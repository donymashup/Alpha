//newalpha

import 'package:alpha/features/auth/screen/login.dart';
import 'package:alpha/features/auth/screen/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:alpha/constants/app_constants.dart'; // Adjust this import as needed
import 'package:alpha/common%20widgets/welcome_screen.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart'; // Adjust this import as needed

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      imagePath: 'assets/images/OnboardingImg1.png',
      title: 'Engaging Interactive Questions',
      description:
          'Crafted to evoke curiosity, this will develop students thinking abilities and strengthen their understanding of core concepts.',
    ),
    OnboardingPageModel(
      imagePath: 'assets/images/OnboardingImg2.png',
      title: 'A COMPLETE LEARNING APP FOR CLASS 6 - 12 STUDENTS',
      description: 'Covers all boards and competitive exams',
    ),
    OnboardingPageModel(
      imagePath: 'assets/images/OnboardingImg3.png',
      title: 'PERFORMANCE INDEX',
      description:
          'Track your progress till date through graphical analysis of tests, view your progress in terms of percentages accuracy and average time taken.',
    ),
  ];
  
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.backgroundColor,
      body: Stack(
        children: [

          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: pages.length + 1, // Add one for the WelcomePage
            itemBuilder: (context, index) {
              if (index == pages.length) {
                return WelcomePage(
                  currentIndex: currentIndex,
                  totalPages: pages.length + 1,
                );
              } else {
                return OnboardingPage(
                  page: pages[index],
                  currentIndex: currentIndex,
                  totalPages: pages.length + 1,
                );
              }
            },
          ),
          currentIndex < pages.length
          ? Positioned(
              bottom: 20,
              right: 20,
              child: TextButton(
                onPressed: () {
                  _pageController.jumpToPage(pages.length);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SwipeableButtonView(
                        buttonText: 'Login with Phone',
                        buttonWidget: const Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 86, 90, 216),
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
                              builder: (context) => Login(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingPageModel {
  final String imagePath;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingPageModel page;
  final int currentIndex;
  final int totalPages;

  const OnboardingPage({
    required this.page,
    required this.currentIndex,
    required this.totalPages,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: AppConstant.backgroundColor,
            child: ClipPath(
              clipper: BottomRoundedClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: AppConstant.primaryColor,
                ),
                child: Center(
                  child: Image.asset(page.imagePath, height: 250),
                ),
              ),
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
                    totalPages,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentIndex == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                            currentIndex == index ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        page.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.titlecolor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        page.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppConstant.subtitlecolor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 150,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
