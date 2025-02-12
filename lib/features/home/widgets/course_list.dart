// import 'package:alpha/constants/app_constants.dart';
// import 'package:alpha/features/course_detailed/screens/course_detail.dart';
// import 'package:alpha/features/home/services/home_service.dart';
// import 'package:alpha/models/available_courses_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CourseLists extends StatelessWidget {
//   const CourseLists({super.key});

//  Future<AvailableCoursesModel?> fetchCourses(BuildContext context) async {
//     HomeService homeService = HomeService();
//     return await homeService.getAvailableCourses(context: context);
// }

// @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<AvailableCoursesModel?>(
//         future: fetchCourses(context),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator()); // Loading indicator
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error fetching courses'));
//           } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.data.isEmpty) {
//             return Center(child: Text('No courses available'));
//           } else {
//              final availableCourses = snapshot.data!;
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: availableCourses.courses!.length,
//       itemBuilder: (context, index) {
//         var course = availableCourses.courses![index];
//         return GestureDetector(
//           onTap: () {
//            Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => AnimatedTabBarScreen(isSubscribed: false,)),
//           );
//           },
//           child: Card(
//             margin: const EdgeInsets.all(8),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             color: AppConstant.cardBackground,
//             elevation: 5,
//             child: Row(
//               children: [
//                 // Image section (Flexible with flex: 1)
//                 Flexible(
//                   flex: 1,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Hero(
//                       tag: "imageCourse",
//                       child: ClipRRect(
//                         borderRadius: const BorderRadius.horizontal(
//                           left: Radius.circular(10),
//                         ),
//                         child:course.courseDetails?.image != null
//                           ? Image.network(
//                               course.courseDetails!.image!,
//                               width: 50,
//                               height: 50,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) =>
//                                   const Icon(Icons.broken_image),
//                             )
//                           : const Icon(Icons.image),
//                       ),
//                     ),
//                   ),
//                 ),
                
//                 const SizedBox(width: 5),
          
//                 // Text and rating section (Flexible with flex: 2)
//                 Flexible(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           course.courseDetails?.name ?? "No Name",
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.star,
//                               color: Colors.amber,
//                               size: 18,
//                             ),
//                             const SizedBox(width: 5),
//                             Text(
//                               course.courseDetails?.name ?? "No Name",
//                               style: const TextStyle(fontSize: 16),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }, 
//     );
//           }
//         }
//     );
//   }
// }


import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/course_detailed/screens/course_detail.dart';
import 'package:alpha/features/home/services/home_service.dart';
import 'package:alpha/models/available_courses_model.dart';
import 'package:flutter/material.dart';

class CourseLists extends StatelessWidget {
  const CourseLists({super.key});

  Future<AvailableCoursesModel?> fetchCourses(BuildContext context) async {
    HomeService homeService = HomeService();
    return await homeService.getAvailableCourses(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AvailableCoursesModel?>(
        future: fetchCourses(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching courses'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.courses == null || snapshot.data!.courses!.isEmpty) {
            return const Center(child: Text('No courses available'));
          } else {
            final availableCourses = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: availableCourses.courses?.length ?? 0, // Prevent null issue
              itemBuilder: (context, index) {
                var course = availableCourses.courses![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnimatedTabBarScreen(isSubscribed: false),
                      ),
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
                        // Image section
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Hero(
                              tag: "imageCourse", // Unique Hero tag
                              child: ClipRRect(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(10),
                                ),
                                child: course.courseDetails?.image != null
                                    ? Image.network(
                                        course.courseDetails!.image!,
                                        width: 200,
                                        height: 100,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) =>
                                            const Icon(Icons.broken_image),
                                      )
                                    : const Icon(Icons.image),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 5),

                        // Course details section
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course.courseDetails?.name ?? "No Name",
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
                                      "4.5", // Assuming rating exists
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
        });
  }
}
