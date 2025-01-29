import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/my_courses/widgets/classes_list.dart';
import 'package:alpha/features/my_courses/widgets/overview.dart';
import 'package:alpha/features/my_courses/widgets/reviews.dart';
import 'package:flutter/material.dart';

class AnimatedTabBarScreen extends StatefulWidget {
  @override
  _AnimatedTabBarScreenState createState() => _AnimatedTabBarScreenState();
}

class _AnimatedTabBarScreenState extends State<AnimatedTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            toolbarHeight: 3.0, // Set your desired height
            collapsedHeight: 3.0,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
              double appBarHeight = constraints.maxHeight;
                return FlexibleSpaceBar(
                 titlePadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: appBarHeight > kToolbarHeight ? 16.0 : 0),
                  background: Card(
                    color: AppConstant.cardBackground,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/banner1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.video_camera_back_outlined, color: AppConstant.hindColor, size: 12),
                                  SizedBox(width: 4),
                                  Text(
                                    '26 classes',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200, color: AppConstant.hindColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber, size: 12),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.5',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200, color: AppConstant.hindColor),
                                  ),
                                  SizedBox(width:8),
                                  Text(
                                    '1k+ reviews',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200, color: AppConstant.hindColor),
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
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            OverviewCard(),
            ClassesList(),
            ReviewTab(),
          ],
        ),
      ),
    );
  }
}
