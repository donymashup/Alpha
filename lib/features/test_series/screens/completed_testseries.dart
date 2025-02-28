import 'package:flutter/material.dart';

class CompletedTestSeriesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> completedTestSeries = [
    {
      'title': 'Completed Test 1',
      'startTime': '10:00 AM',
      'endTime': '11:30 AM',
      'duration': '1h 30m',
      'totalMarks': 100,
    },
    {
      'title': 'Completed Test 2',
      'startTime': '02:00 PM',
      'endTime': '03:15 PM',
      'duration': '1h 15m',
      'totalMarks': 80,
    },
    {
      'title': 'Completed Test 3',
      'startTime': '09:00 AM',
      'endTime': '10:45 AM',
      'duration': '1h 45m',
      'totalMarks': 120,
    },
    {
      'title': 'Completed Test 4',
      'startTime': '04:30 PM',
      'endTime': '06:00 PM',
      'duration': '1h 30m',
      'totalMarks': 90,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completed Test Series')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: completedTestSeries.length,
        itemBuilder: (context, index) {
          var test = completedTestSeries[index];

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.check_circle, size: 30, color: Colors.green),
                    title: Text(
                      test['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Navigate to test results or review test
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: const Text("Review"),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoText('Start Time', test['startTime']),
                      _infoText('End Time', test['endTime']),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoText('Duration', test['duration']),
                      _infoText('Total Marks', test['totalMarks'].toString()),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _infoText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
