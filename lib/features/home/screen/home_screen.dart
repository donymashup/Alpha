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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppConstant.item.length,
                itemBuilder: (context, index) {
                  final item = AppConstant.item[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: AppConstant.cardBackground,
                    elevation: 5,
                    child: Row(
                      children: [
                        // Image section
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                            ),
                            child: Image.asset(
                              item["imagePath"],
                              width: 200,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Text and rating section
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "${item["rating"]}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}