import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class OngoingClasses extends StatelessWidget {
  const OngoingClasses({super.key});

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
                  Row(
                    children: const [
                      Icon(FluentIcons.live_24_regular, size: 18),
                      SizedBox(width: 4),
                      Text("223"),
                      SizedBox(width: 56),
                      Icon(Icons.fiber_manual_record, color: Colors.red, size: 12),
                      SizedBox(width: 4),
                      Text("Live", style: TextStyle(color: Colors.red)),
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
