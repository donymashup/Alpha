import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/course_detailed/screens/course_detail.dart';
import 'package:flutter/material.dart';

class CourseLists extends StatelessWidget {
  const CourseLists({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: AppConstant.item.length,
      itemBuilder: (context, index) {
        final item = AppConstant.item[index];
        return GestureDetector(
          onTap: () {
           Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => AnimatedTabBarScreen(course: item,isSubscribed: false,)),
          );
          },
          child: Card(
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: AppConstant.cardBackground,
            elevation: 5,
            child: Row(
              children: [
                // Image section (Flexible with flex: 1)
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: "imageCourse_${item["title"]}",
                      child: ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(10),
                        ),
                        child: Image.asset(
                          item["imagePath"],
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(width: 5),
          
                // Text and rating section (Flexible with flex: 2)
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["title"],
                          style: const TextStyle(
                            fontSize: 16,
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
          ),
        );
      }, 
    );
  }
}
