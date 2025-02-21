import 'package:flutter/material.dart';

class CompletedTestSeriesScreen extends StatelessWidget {
  final List<String> completedTestSeries = [
    'Completed Test 1',
    'Completed Test 2',
    'Completed Test 3',
    'Completed Test 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: completedTestSeries.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.check_circle, size: 30, color: Colors.green),
              title: Text(completedTestSeries[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to test results or review test
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text("Review"),
              ),
            ),
          );
        },
      ),
    );
  }
}
