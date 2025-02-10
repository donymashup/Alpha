import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class RecordingsCourses extends StatelessWidget {
  const RecordingsCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: const [
            ClassCard(
              title: "Basics of Algebra",
              subject: "Mathematics",
              imageUrl: "assets/images/ongoingcourse.png",
            ),
            ClassCard(
              title: "Basics of Lights",
              subject: "Science",
              imageUrl: "assets/images/ongoingcourse1.png",
            ),
            ClassCard(
              title: "Basics of Trigonometry",
              subject: "Mathematics",
              imageUrl: "assets/images/ongoingcourse2.png",
            ),
          ],
        ),
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  final String title;
  final String subject;
  final String imageUrl;

  const ClassCard({
    required this.title,
    required this.subject,
    required this.imageUrl,
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
            /// Image section - Fixed width
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 80, // Fixed width for image to prevent expansion
                height: 80,
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),

            /// Text section - Flexible width
            Flexible(
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

                  /// Updated Recorded Info Row (Replaced with Date)
                  Row(
                    children: const [
                      Icon(FluentIcons.video_24_regular, size: 18, color: Colors.blue),
                      SizedBox(width: 4),
                      Text("45 min", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Icon(FluentIcons.calendar_24_regular, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text("12 Jan 2025", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
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
