import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/is_subscribed_controller.dart';
import 'package:alpha/features/quiz/screen/quiz_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ClassesList extends StatelessWidget {
  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'Mathematics',
      'icon': LucideIcons.calculator,
      'topics': [
        {
          'name': 'Algebra',
          'videos': ['Algebra Basics', 'Advanced Algebra'],
          'materials': ['Algebra PDF', 'Practice Problems'],
          'quizzes': ['Quiz 1', 'Quiz 2']
        },
        {
          'name': 'Geometry',
          'videos': ['Geometry Basics'],
          'materials': ['Geometry PDF'],
          'quizzes': ['Quiz 1']
        },
      ]
    },
    {
      'name': 'Science',
      'icon': LucideIcons.atom,
      'topics': [
        {
          'name': 'Physics',
          'videos': ['Motion Tutorial'],
          'materials': ['Physics Notes'],
          'quizzes': ['Quiz 1', 'Quiz 2']
        },
        {
          'name': 'Chemistry',
          'videos': ['Periodic Table Explained'],
          'materials': ['Chemistry Workbook'],
          'quizzes': ['Quiz 1']
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjects.expand((subject) => subject['topics']).length,
      itemBuilder: (context, index) {
        final topicWithSubject = subjects.expand((subject) =>
            subject['topics'].map((topic) => {'subject': subject['name'], 'icon': subject['icon'], ...topic})).toList()[index];

        return Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: AppConstant.cardBackground,
            elevation: 4,
            child: ExpansionTile(
              title: Row(
                children: [
                  Icon(topicWithSubject['icon'], color: Colors.teal),
                  SizedBox(width: 10),
                  Text(
                    topicWithSubject['name'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text(topicWithSubject['subject'], style: TextStyle(color: Colors.grey)),
              ),
              children: [
                _buildListSection('Videos', topicWithSubject['videos'], LucideIcons.video, Colors.redAccent),
                Divider(),
                _buildListSection('Study Materials', topicWithSubject['materials'], LucideIcons.file, Colors.blueAccent),
                Divider(),
                _buildListSection('Quizzes', topicWithSubject['quizzes'], LucideIcons.checkSquare, Colors.green),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListSection(String title, List<String> items, IconData icon, Color iconColor) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GestureDetector(
                       onTap: () {
                      if (title == "Quizzes") {
                        // Navigate only for Quizzes
                        Get.to(() => QuizInfo());
                      }
                    },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         
                          Text(item),
                           Obx(() {
                            final controller = Get.find<IsSubscribedController>();
                            return controller.isSubscribed.value
                            ? SizedBox() // Hide lock icon when state is false
                            :  Icon(Icons.lock_outline, size: 20, color: Colors.grey);
                          }),
                         
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
