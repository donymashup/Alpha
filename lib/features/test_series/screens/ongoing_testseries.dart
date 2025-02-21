import 'package:flutter/material.dart';

class OngoingTestSeries extends StatelessWidget {
  final List<String> testSeries = [
    'Test Series 1',
    'Test Series 2',
    'Test Series 3',
    'Test Series 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: testSeries.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.assignment, size: 30, color: Colors.blue),
              title: Text(testSeries[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to test details or start test
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text("Start"),
              ),
            ),
          );
        },
      ),
    );
  }
}
