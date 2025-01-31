import 'package:alpha/common%20widgets/customappbar.dart';
import 'package:alpha/common%20widgets/drawermenu/drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class TestSeriesScreen extends StatelessWidget {
  const TestSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle: "Test Series"),
      drawer: const DrawerScreen(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          TestCard(
            title: "Mathematics Practice Test",
            subject: "Mathematics",
            questions: 20,
            time: "30 min",
          ),
          TestCard(
            title: "Science Concept Quiz",
            subject: "Science",
            questions: 25,
            time: "40 min",
          ),
          TestCard(
            title: "History & Geography Challenge",
            subject: "Social Studies",
            questions: 15,
            time: "25 min",
          ),
        ],
      ),
    );
  }
}

class TestCard extends StatelessWidget {
  final String title;
  final String subject;
  final int questions;
  final String time;

  const TestCard({
    required this.title,
    required this.subject,
    required this.questions,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(FluentIcons.clipboard_task_list_16_regular, size: 30, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$subject • $questions Questions • $time"),
        trailing: ElevatedButton(
          onPressed: () {
            // Navigate to test details or start test
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: const Text("Start"),
        ),
      ),
    );
  }
}
