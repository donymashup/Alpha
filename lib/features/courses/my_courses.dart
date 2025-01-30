import 'package:alpha/common%20widgets/customappbar.dart';
import 'package:alpha/common%20widgets/drawermenu/drawer.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle: "My Subscribed Courses"),
      drawer: const DrawerScreen(),
      body:SingleChildScrollView(
        child: ListView.builder(
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(10),
                          ),
                          child: Image.asset(
                            item["imagePath"],
                            height:   150,
                            width : double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            item["title"],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                         Row(
                          children: [
                            const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${item["rating"]}",
                                style: const TextStyle(fontSize: 14),
                              ),
                          ],
                         )
                      ],
                    )
                  ],
                ),
              ),
            ); 
          },
        ),
      ),
    );

  }
}