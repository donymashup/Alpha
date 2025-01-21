import 'package:flutter/material.dart';
import 'package:alpha/constants/app_constants.dart'; // Correct import statement
import 'package:alpha/features/auth/screen/registration.dart'; // Correct import statement for RegistrationScreen
import 'package:swipeable_button_view/swipeable_button_view.dart'; // Import SwipeableButtonView

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                return WelcomePage(currentIndex: currentIndex, totalPages: pages.length + 1);
              } else {
                return OnboardingPage(
                  page: pages[index],
                  currentIndex: currentIndex,
                  totalPages: pages.length + 1,
                  onTapRight: () {
                    if (currentIndex < pages.length) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                );
              }
            },
          ),
          if (currentIndex < pages.length)
            Positioned(
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
  final VoidCallback onTapRight;

  const OnboardingPage({
    required this.page,
    required this.currentIndex,
    required this.totalPages,
    required this.onTapRight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (currentIndex == totalPages - 1 && details.primaryVelocity! < 0) {
          onTapRight();
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: AppConstant.backgroundColor, // Set the side color to match the second container
                    child: ClipPath(
                      clipper: BottomRoundedClipper(), // Custom clipper for bottom rounded corners
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppConstant.primaryColor2,
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
                                color: currentIndex == index ? Colors.blue : Colors.grey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
            ),
          ),
        ],
      ),
    );
  }
}

class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height - 150,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

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
                  color: Colors.blue.withOpacity(0.8),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 2 - 50,
              right: 120,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue,
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