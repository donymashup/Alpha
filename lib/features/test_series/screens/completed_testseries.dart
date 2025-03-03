import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/test_series/services/completed_testseries_services.dart';
import 'package:flutter/material.dart';
import 'package:alpha/models/completed_testseries_model.dart';

class CompletedTestSeriesScreen extends StatefulWidget {
  @override
  _CompletedTestSeriesScreenState createState() => _CompletedTestSeriesScreenState();
}

class _CompletedTestSeriesScreenState extends State<CompletedTestSeriesScreen> {
  List<Attended> completedTestSeries = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchCompletedTests();
  }

  Future<void> fetchCompletedTests() async {
    CompletedTestseriesServices service = CompletedTestseriesServices();
    var response = await service.getAttendedTests(userId: '1', context: context);
    
    if (response != null && response.attended != null) {
      setState(() {
        completedTestSeries = response.attended!;
        isLoading = false;
      });
    } else {
      setState(() {
        errorMessage = "Failed to fetch completed test series.";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.backgroundColor, // 🔹 Added background color
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Show loader
          : errorMessage != null
              ? Center(child: Text(errorMessage!, style: TextStyle(color: Colors.red)))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: completedTestSeries.length,
                  itemBuilder: (context, index) {
                    var test = completedTestSeries[index];

                    return Card(
                      color: Colors.white, // Ensures good contrast with background
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4, // Adds slight shadow for depth
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.check_circle, size: 30, color: Colors.green),
                              title: Text(
                                test.name ?? "Unnamed Test",
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
                                _infoText('Start Time', test.start ?? "N/A"),
                                _infoText('End Time', test.subTime ?? "N/A"),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _infoText('Duration', test.duration ?? "N/A"),
                                _infoText('Total Marks', test.answerid ?? "N/A"), // Adjust as per API
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
