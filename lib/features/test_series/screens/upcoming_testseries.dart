import 'package:flutter/material.dart';

class UpcomingTestSeriesScreen extends StatelessWidget {
  final List<String> upcomingTestSeries = [
    'Upcoming Test 1',
    'Upcoming Test 2',
    'Upcoming Test 3',
    'Upcoming Test 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: upcomingTestSeries.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.access_time, size: 30, color: Colors.green),
              title: Text(upcomingTestSeries[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to details or set reminder
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text("Details"),
              ),
            ),
          );
        },
      ),
    );
  }
}
