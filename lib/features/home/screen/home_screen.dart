import 'package:alpha/common%20widgets/customappbar.dart';
import 'package:alpha/common%20widgets/drawermenu/drawer.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/user_controller.dart';
import 'package:alpha/features/home/widgets/carousel.dart';
import 'package:alpha/features/home/widgets/course_list.dart';
import 'package:alpha/features/home/widgets/custom_Image_Button.dart';
import 'package:alpha/features/home/widgets/header_list.dart';
import 'package:alpha/features/home/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {  
  HomeScreen({super.key});
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(() => CustomAppBar(appbarTitle: "Hello, ${userController.username}")),
      ),
      drawer: const DrawerScreen(),
      body: Container(
        color: AppConstant.backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card-like UI with Lottie Animation
                Card(
                  color: AppConstant.cardBackground, // Change the card background color
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome!",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Let's Learn",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Something new today",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Lottie.asset(
                          'assets/lottie/Animation - 1740046298623.json', // Path to your Lottie file
                          height: 120,
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 5),
                const SearchField(),
                const SizedBox(height: 10),
                const CarouselImage(),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 50,
                  child: HeaderList(),
                ),
                const SizedBox(height: 10),
                const CourseLists(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
