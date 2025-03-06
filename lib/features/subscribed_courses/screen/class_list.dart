import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/subscribed_courses/screen/subject_list.dart';
import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
import 'package:alpha/models/classs_list_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
              backgroundColor: Colors.white,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  bool isCollapsed = constraints.maxHeight <= kToolbarHeight;

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background Image
                      Image.network(
                        widget.courseImage,
                        fit: BoxFit.cover,
                      ),
                      // Gradient Overlay (Darker at Bottom)
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.9), // Dark at the bottom
                              Colors.transparent,            // Clear at the top
                            ],
                          ),
                        ),
                      ),
                      // Title positioned at the bottom left
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 45, bottom: 10),
                          child: Text(
                            widget.courseName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isCollapsed ? 18 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
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
                              child: CachedNetworkImage(
                                imageUrl: list.classImage ?? "",
                                height: 100,
                                width: 150,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height: 100,
                                    width: 150,
                                    color: Colors.white,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Image.asset(
                                  "assets/images/course1.png",
                                  height: 100,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                list.className ?? "Course Name",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
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
