import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class UpcomingCourses extends StatelessWidget {
  const UpcomingCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: const [
          ClassCard(
            title: "Basics of Algebra",
            subject: "Mathematics",
            imageUrl: "assets/images/ongoingcourse.png",
            date: "Feb 10, 2025",
            startTime: "10:00 AM",
          ),
          ClassCard(
            title: "Basics of Lights",
            subject: "Science",
            imageUrl: "assets/images/ongoingcourse1.png",
            date: "Feb 12, 2025",
            startTime: "2:00 PM",
          ),
          ClassCard(
            title: "Basics of Trigonometry",
            subject: "Mathematics",
            imageUrl: "assets/images/ongoingcourse2.png",
            date: "Feb 15, 2025",
            startTime: "4:30 PM",
          ),
        ],
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String title;
  final String subject;
  final String imageUrl;
  final String date;
  final String startTime;

  const ClassCard({
    required this.title,
    required this.subject,
    required this.imageUrl,
    required this.date,
    required this.startTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image section - 1/3 of the row
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imageUrl, width: double.infinity, height: 80, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),

            /// Text section - 2/3 of the row
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Foundation class 8",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subject,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  
                  /// Date and Start Time Row
                  Row(
                    children: [
                      Icon(FluentIcons.calendar_ltr_24_regular, size: 18, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text(date, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 16),
                      Icon(FluentIcons.clock_24_regular, size: 18, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(startTime, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
