import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/is_subscribed_controller.dart';
import 'package:alpha/features/course_detailed/services/course_details_services.dart';
import 'package:alpha/features/course_detailed/widgets/classes_list.dart';
import 'package:alpha/features/course_detailed/widgets/enroll_button.dart';
import 'package:alpha/features/course_detailed/widgets/overview.dart';
import 'package:alpha/features/course_detailed/widgets/reviews.dart';
import 'package:alpha/models/available_courses_model.dart';
import 'package:alpha/models/course_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedTabBarScreen extends StatefulWidget {
  // final Map<String, dynamic> course; // Accept course data
  final bool isSubscribed;
  final String heroImage;
  final String heroImageTag;
  final String courseId;
  const AnimatedTabBarScreen({
    super.key,
    // this.course,
    required this.isSubscribed,
    required this.heroImage,
    required this.heroImageTag,
    required this.courseId,
  });
  @override
  _AnimatedTabBarScreenState createState() => _AnimatedTabBarScreenState();
}

class _AnimatedTabBarScreenState extends State<AnimatedTabBarScreen>
    with SingleTickerProviderStateMixin {
  final IsSubscribedController controller = Get.find();
  late TabController _tabController;
  late Future<CourseDetailsModel?> _futureCourseDetails;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    controller.setVisibility(widget.isSubscribed);
    _futureCourseDetails = futureCourseDetails(context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<CourseDetailsModel?> futureCourseDetails(BuildContext context) async {
    CourseDetailsService courseDetailsService = CourseDetailsService();
    return await courseDetailsService.getCourseDetails(
        context: context, courseId: widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CourseDetailsModel?>(
      future: _futureCourseDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData) {
          return Scaffold(
            body: Center(child: Text('No data available')),
          );
        } else {
          final courseDetails = snapshot.data;
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        expandedHeight:
                            MediaQuery.of(context).size.height * 0.35,
                        toolbarHeight: 15.0,
                        collapsedHeight: 15.0,
                        pinned: true,
                        flexibleSpace: LayoutBuilder(
                          builder: (context, constraints) {
                            double appBarHeight = constraints.maxHeight;
                            return FlexibleSpaceBar(
                              titlePadding: EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical:
                                      appBarHeight > kToolbarHeight ? 16.0 : 0),
                              background: Card(
                                elevation: 4,
                                margin: EdgeInsets.all(10),
                                color: AppConstant.cardBackground,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: widget.heroImageTag,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  widget.heroImage),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                  Icons
                                                      .video_camera_back_outlined,
                                                  color: AppConstant.hindColor,
                                                  size: 12),
                                              SizedBox(width: 4),
                                              Text(
                                                '26 classes',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w200,
                                                    color:
                                                        AppConstant.hindColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: Colors.amber,
                                                  size: 12),
                                              SizedBox(width: 4),
                                              Text(
                                                '4.5',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w200,
                                                    color:
                                                        AppConstant.hindColor),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '1k+ reviews',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w200,
                                                    color:
                                                        AppConstant.hindColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(kToolbarHeight),
                          child: Material(
                            color: AppConstant.cardBackground,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: TabBar(
                                controller: _tabController,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppConstant.primaryColor,
                                ),
                                unselectedLabelColor: AppConstant.titlecolor,
                                labelColor: AppConstant.cardBackground,
                                tabs: const [
                                  Tab(text: "Overview"),
                                  Tab(text: "Modules"),
                                  Tab(text: "Review"),
                                ],
                                indicatorSize: TabBarIndicatorSize.tab,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    body: TabBarView(
                      controller: _tabController,
                      children: [
                        OverviewTab(
                          description: courseDetails?.description ??
                              "No description available",
                        ),
                        ClassesList(courseDetailsModel: courseDetails!),
                        ReviewTab(courseDetailsModel: courseDetails!),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    left: 16.0,
                    right: 16.0,
                    child: Obx(() {
                      final controller = Get.find<IsSubscribedController>();
                      return controller.isSubscribed.value
                          ? SizedBox()
                          : EnrollButton(courseDetailsModel: courseDetails!);
                    }),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  void fetchCourseDetails() {}
}
