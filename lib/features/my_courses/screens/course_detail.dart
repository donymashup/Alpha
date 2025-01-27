import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/my_courses/screens/classes_list.dart';
import 'package:alpha/features/my_courses/screens/overview.dart';
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
      
      body: Column(
      
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: AppConstant.cardBackground,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/banner1.png'), // Replace with your image asset
                          fit: BoxFit.cover,
                          
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                    children: [
                      Icon(Icons.video_camera_back_outlined, color:  AppConstant.hindColor, size: 12,),
                      SizedBox(width: 4),
                      Text(
                        '26 classes',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200,color: AppConstant.hindColor),
                      ),
                    ],
                  ),
                     Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 12,),
                      SizedBox(width: 4),
                      Text(
                        '4.5',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200,color: AppConstant.hindColor),
                      ),
                    ],
                  ),
            
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: AppConstant.cardBackground,
              child: TabBar(
              controller: _tabController,
              //indicator: null,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Rounded indicator
                color: AppConstant.primaryColor,
                
              ),
              
              unselectedLabelColor: AppConstant.titlecolor,
              labelColor: AppConstant.cardBackground,
              //padding: EdgeInsets.only(right: 8,left: 8,top: 8),
              tabs: const [
                Tab( text: "Overview"),
                Tab( text: "Classes"),
                Tab(text: "Review"),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
                      ),
            ),
          ),
       
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                OverviewCard(),
                SubjectScreen(),
                OverviewCard(),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}


