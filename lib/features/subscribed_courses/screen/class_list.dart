import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/subscribed_courses/screen/subject_list.dart';
import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
import 'package:alpha/models/classs_list_model.dart';
import 'package:flutter/material.dart';

class ClassList extends StatefulWidget {
  final String courseId;
  final String courseName;
  final String batchId;
  final String courseImage;

  const ClassList({
    required this.courseId,
    required this.courseName,
    required this.batchId,
    required this.courseImage,
    super.key,
  });

  @override
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  late Future<ClassListModel?> _classList;

  @override
  void initState() {
    super.initState();
    _classList = UserSubscriptionsServices()
        .getClassList(context: context, courseId: widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(widget.courseName),
                  background: Image.network(
                    widget.courseImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: FutureBuilder<ClassListModel?>(
            future: _classList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData ||
                  snapshot.data!.classes == null ||
                  snapshot.data!.classes!.isEmpty) {
                return const Center(child: Text("No classes found"));
              }
              return ListView.builder(
                itemCount: snapshot.data!.classes!.length,
                itemBuilder: (context, index) {
                  final list = snapshot.data!.classes![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubjectList(
                            classId: list.classId!,
                            packageId: list.packageid!,
                            batchId: widget.batchId,
                            className: list.className!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: AppConstant.primaryColor2,
                          width: 1,
                        ),
                      ),
                      color: AppConstant.cardBackground,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(10),
                              ),
                              child: Image.network(
                                list.classImage ?? "assets/images/course1.png",
                                height: 100,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              list.className ?? "Course Name",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      ),
    );
  }
}
