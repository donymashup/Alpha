import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Dream Them E-Tutor is now accepting enrollments!",
      "body": "Exciting News! 🎉 Join us for the 2024-2025 school year starting on April 3, 2024.",
      "date": "21-03-2024",
      "image": "assets/images/banner1.png"
    },
    {
      "title": "Exclusive Offer!",
      "body": "Get 10% off on your first tuition fee. Limited time only!",
      "date": "20-03-2024",
      "image": "assets/images/banner2.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold, // Bold title
            fontSize: 18,
          ),
        ),
        backgroundColor: AppConstant.backgroundColor,
      ),
      body: Container(
        color: AppConstant.backgroundColor,
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              color: Colors.black,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification["title"]!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            notification["body"]!,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Text(
                            notification["date"]!,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    if (notification["image"] != null)
                      Container(
                        width: 100,
                        height: 70,
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          notification["image"]!,
                          fit: BoxFit.cover,
                        ),
                      ),
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
