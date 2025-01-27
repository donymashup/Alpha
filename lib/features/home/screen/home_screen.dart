import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/home/widgets/carousel.dart';
import 'package:alpha/features/home/widgets/course_list.dart';
import 'package:alpha/features/home/widgets/custom_Image_Button.dart';
import 'package:alpha/features/home/widgets/header_list.dart';
import 'package:alpha/features/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello, Dora',
          style: TextStyle(
            color: AppConstant.titlecolor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppConstant.backgroundColor,
        leading: CustonImageButtom(path: 'assets/icons/menu.png'), // Correct class name
        actions: [
          IconButton(
            icon: Container(
              decoration: const BoxDecoration(
                color: Colors.white, // Background color of the circle
                shape: BoxShape.circle, // Circular shape
              ),
              padding: const EdgeInsets.all(8), // Adjust padding for the icon size
              child: Image.asset(
                'assets/icons/bell.png',
                height: 24,
                width: 24,
              ),
            ),
            onPressed: () {},
          ),
          CustonImageButtom(path: 'assets/icons/profile.png'), // Correct class name
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    "Let's Learn",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                      color: AppConstant.primaryColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Image(
                    image: AssetImage('assets/icons/cap.png'),
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              const Text(
                'Something new',
                style: TextStyle(
                  fontSize: 30,
                  color: AppConstant.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),
              const SearchField(),
              const SizedBox(height: 20),
              const CarouselImage(),
              const SizedBox(height: 20),
              const SizedBox(
                height: 30,
                child: HeaderList(),
              ),
              const SizedBox(height: 20),
              CourseLists(),
            ],
          ),
        ),
      ),

    );
  }
}

