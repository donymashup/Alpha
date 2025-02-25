import 'package:alpha/models/practice_test_model.dart';
import 'package:flutter/material.dart';

class PracticeTestSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final Future<PracticeTestModel?> fetchFunction;

  const PracticeTestSection({
    super.key,
    required this.icon,
    required this.title,
    required this.fetchFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading with icon
        Row(
          children: [
            Icon(icon, color: Colors.red),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // FutureBuilder to fetch video data
        FutureBuilder<PracticeTestModel?>(
          future: fetchFunction,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.practices!.isEmpty) {
              return const Text("No Data Available",
                  style: TextStyle(color: Colors.grey));
            }

            // Display the list of videos using ListView.builder
            return ListView.builder(
              shrinkWrap: true, // so that it takes minimal space
              physics: const NeverScrollableScrollPhysics(), // disable scrolling inside Column
              itemCount: snapshot.data!.practices!.length,
              itemBuilder: (context, index) {
                final quiz = snapshot.data!.practices![index];
                return Card(
                  color: const Color.fromARGB(255, 184, 222, 252),
                  child: ListTile(
                    title: Text(
                      quiz.practiceTestsName?? "quiz",
                      style: const TextStyle(fontSize: 14),
                    ),
                      trailing: Text(
                        "${quiz.practiceTestsDuration ?? 'quiz'} min",
                        style: const TextStyle(fontSize: 14),
                      ),
                    onTap: () {
                      // Navigate to the video detail page or play the video
                    },
                  ),
                );
              },
            );
          },
        ),

        const SizedBox(height: 12), // Space after section
      ],
    );
  }
}
