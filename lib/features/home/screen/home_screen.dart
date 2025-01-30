import 'package:alpha/common%20widgets/customappbar.dart';
import 'package:alpha/common%20widgets/drawermenu/drawer.dart';
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
      appBar: const CustomAppBar(appbarTitle: "Hello, Dora"),
      drawer: const DrawerScreen(),
      body: Container(
        color: AppConstant.backgroundColor, // Set background color here
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Let's Learn",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        color: AppConstant.primaryColor2,
                      ),
                    ),

                    const SizedBox(width: 10),
                    const Image(
                      image: AssetImage('assets/icons/cap.png'),
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 10), // Moved outside Row
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
                  height: 50,
                  child: HeaderList(),
                ),
                const SizedBox(height: 20),
                const CourseLists(), // Assuming CourseLists is another widget in your project
              ],
            ),
          ),
        ),
      ),
    );
  }
}


