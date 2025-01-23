
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/live/widgets/tabbar_view.dart';
import 'package:flutter/material.dart';



class LiveClassesScreen extends StatelessWidget {
  const LiveClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Classes',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppConstant.backgroundColor,
        leading: IconButton(
          icon: Image.asset('assets/icons/menu.png'),
          onPressed: () {
            // Menu functionality
          },
        ),
        actions: [
          IconButton(
            icon: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/icons/bell.png',
                height: 24,
                width: 24,
              ),
            ),
            onPressed: () {
              // Notification functionality
            },
          ),
          IconButton(
            icon: Image.asset('assets/icons/profile.png'),
            onPressed: () {
              // Profile functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomTabBarView(), // Includes the TabBar and TabBarView
          ),
        ],
      ),
    );
  }
}
