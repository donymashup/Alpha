import 'package:alpha/common%20widgets/customappbar.dart';
import 'package:alpha/common%20widgets/drawermenu/drawer.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/course_detailed/screens/course_detail.dart';
import 'package:alpha/features/subscribed_courses/screen/class_list.dart';
import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
import 'package:alpha/models/user_subscriptions_model.dart';
import 'package:flutter/material.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
late Future<UserSubscriptionsModel?> _futureSubscriptions;

  @override
  void initState() {
    super.initState();
    _futureSubscriptions = UserSubscriptionsServices().getUserSubscriptions(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle: "My Subscribed Courses"),
      drawer: const DrawerScreen(),
      backgroundColor: AppConstant.backgroundColor,
      body:  SafeArea(
        child: FutureBuilder<UserSubscriptionsModel?>(
          future: _futureSubscriptions,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.courses == null || snapshot.data!.courses!.isEmpty) {
              return const Center(child: Text("No courses found"));
            }
            return ListView.builder(
              itemCount: snapshot.data!.courses!.length,
              itemBuilder: (context, index) {
                final course = snapshot.data!.courses![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassList(courseId:course.courseDetails!.courseListId!,courseName:course.courseDetails?.courseListName ?? "Course Name",batchId:course.courseDetails!.batchListId!),
                      ),
                    );
                  },
                  child: Card(
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
                            child: Image.network(
                              course.courseDetails?.courseListImage ?? "assets/images/course1.png",
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                course.courseDetails?.courseListName ?? "Course Name",
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
                                    course.avgStars?.toString() ?? "0.0",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
