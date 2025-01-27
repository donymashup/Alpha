import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SubjectScreen extends StatelessWidget {
  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'Mathematics',
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
    return CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final subject = subjects[index];
                return Card(
                  color: Colors.white, // Set the background color to white
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias, // Ensures content respects card boundaries
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Icon(LucideIcons.bookOpen, color: Colors.teal),
                        SizedBox(width: 10),
                        Text(
                          subject['name'],
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    children: List.generate(
                      subject['topics'].length,
                      (topicIndex) {
                        final topic = subject['topics'][topicIndex];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Card(
                            color: Colors.white, // Set the background color to white
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 2,
                            clipBehavior: Clip.antiAlias, // Ensures content respects card boundaries
                            child: ExpansionTile(
                              title: Row(
                                children: [
                                  Icon(LucideIcons.fileText, color: Colors.amber),
                                  SizedBox(width: 8),
                                  Text(
                                    topic['name'],
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              children: [
                                // Videos section with parallel icons
                                ListTile(
                                 // leading: Icon(LucideIcons.video, color: Colors.redAccent),
                                  title: Row(
                                    children: [
                                      Icon(LucideIcons.video, color: Colors.redAccent),
                                      SizedBox(width: 8),
                                      Text('Videos', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: topic['videos']
                                          .map<Widget>((video) => GestureDetector(
                                                onTap: () {
                                                  // Navigate to a new page when video is tapped
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => VideoPage(videoName: video),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                  child: Text(video),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                Divider(),
                                
                                // Materials section with parallel icons
                                ListTile(
                                  //leading: Icon(LucideIcons.file, color: Colors.blueAccent),
                                  title: Row(
                                    children: [
                                      Icon(LucideIcons.file, color: Colors.blueAccent),
                                      SizedBox(width: 8),
                                      Text('Study Materials', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: topic['materials']
                                          .map<Widget>((material) => Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                child: Text(material),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                Divider(),

                                // Quizzes section with parallel icons
                                ListTile(
                                 // leading: Icon(LucideIcons.checkSquare, color: Colors.green),
                                  title: Row(
                                    children: [
                                      Icon(LucideIcons.checkSquare, color: Colors.green),
                                      SizedBox(width: 8),
                                      Text('Quizzes', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: topic['quizzes']
                                          .map<Widget>((quiz) => Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                child: Text(quiz),
                                              ))
                                          .toList(),
                                    ),
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
              },
              childCount: subjects.length,
            ),
          )
        ],
      );
  }
}

class VideoPage extends StatelessWidget {
  final String videoName;

  VideoPage({required this.videoName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(videoName)),
      body: Center(
        child: Text('This is the page for $videoName'),
      ),
    );
  }
}
