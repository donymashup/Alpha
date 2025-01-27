import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatefulWidget {
  const CarouselImage({super.key});

  @override
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Start auto-scroll
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() async {
    while (true) {
      // Wait for the delay duration
      await Future.delayed(const Duration(seconds: 3));

      // Check if the controller has clients and the widget is mounted
      if (_controller.hasClients && mounted) {
        int nextPage = (_currentIndex + 1) % AppConstant.carouselImages.length;
        _controller.animateToPage(
          nextPage,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentIndex = nextPage;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200, // Height of the carousel
          child: PageView.builder(
            controller: _controller,
            itemCount: AppConstant.carouselImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                AppConstant.carouselImages[index], // Use asset paths here
                fit: BoxFit.fill,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: AppConstant.carouselImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.jumpToPage(entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == entry.key ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == entry.key ? AppConstant.primaryColor3 : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}