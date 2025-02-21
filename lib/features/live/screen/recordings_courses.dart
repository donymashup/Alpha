import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/live/services/live_service.dart';
import 'package:alpha/features/live/widgets/calender.dart';
import 'package:alpha/models/live_model.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:intl/intl.dart';

// class RecordingsCourses extends StatefulWidget {
//   const RecordingsCourses({super.key});

//   @override
//   State<RecordingsCourses> createState() => _RecordingsCoursesState();
// }

// class _RecordingsCoursesState extends State<RecordingsCourses> {
//   final LiveService _liveService = LiveService(); // Initialize LiveService

//   Future<LiveModel?>? _liveClassFuture; // Future to hold API response

//   @override
//   void initState() {
//     super.initState();
//     _fetchLiveClasses();
//   }

//   void _fetchLiveClasses() {
//     setState(() {
//       _liveClassFuture = _liveService.getLiveClass(
//         context: context,
//       );
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         HorizontalCalendar(),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SizedBox(
//             width: double.infinity,
//             child: FutureBuilder<LiveModel?>(
//               future: _liveClassFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                       child: CircularProgressIndicator()); // Show loading
//                 } else if (snapshot.hasError || snapshot.data == null) {
//                   return const Center(
//                       child: Text("Failed to load upcoming classes"));
//                 } else if (snapshot.data!.completed == null ||
//                     snapshot.data!.completed!.isEmpty) {
//                   return const Center(
//                       child: Text("No Recording classes available"));
//                 }
        
//                 // Extract upcoming classes
//                 List<Completed> recordedClasses = snapshot.data!.completed!;
//                 // Handle null months list properly
//                 final months = recordedClasses[0].months ?? [];
//                 final dataList = months.isNotEmpty ? months[0].data ?? [Data()] : [Data()];
        
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: dataList.length,
//                   itemBuilder: (context, index) {
        
//                     return ClassCard(
//                       title: dataList.isNotEmpty
//                           ? dataList[index].title ?? "No Title"
//                           : "No Title",
//                       tutor: dataList[index].faculty ?? "No Faculty",
//                       imageUrl:dataList[index].avatar ?? "assets/images/ongoingcourse.png", // Default or dynamic image
//                       date: dataList[index].start != null  ? DateFormat("MMM dd, yyyy").format(DateTime.parse(dataList[index].start!)) : "No Date",
//                       startTime: dataList[index].start!= null ? DateFormat("h:mm a").format(DateTime.parse(dataList[index].start!)) : "No Time",
        
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


class RecordingsCourses extends StatefulWidget {
  const RecordingsCourses({super.key});

  @override
  State<RecordingsCourses> createState() => _RecordingsCoursesState();
}

class _RecordingsCoursesState extends State<RecordingsCourses> {
  final LiveService _liveService = LiveService(); // Initialize LiveService
  Future<LiveModel?>? _liveClassFuture; // Future to hold API response
  DateTime selectedDate = DateTime.now(); // Default selected date is today

  @override
  void initState() {
    super.initState();
    _fetchLiveClasses();
  }

  void _fetchLiveClasses() {
    setState(() {
      _liveClassFuture = _liveService.getLiveClass(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Calendar Widget with selectedDate handling
        HorizontalCalendar(
          onDateSelected: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: FutureBuilder<LiveModel?>(
              future: _liveClassFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return const Center(child: Text("Failed to load upcoming classes"));
                } else if (snapshot.data!.completed == null || snapshot.data!.completed!.isEmpty) {
                  return const Center(child: Text("No Recording classes available"));
                }

                List<Completed> recordedClasses = snapshot.data!.completed!;
                final months = recordedClasses[0].months ?? [];

                // Find the month that matches the selected date
                Months? selectedMonth = months.firstWhere(
                  (month) => month.name != null && _isMonthMatch(month.name!, selectedDate),
                  orElse: () => Months(name: "", data: []), // Return empty if not found
                );

                final dataList = selectedMonth.data ?? [];

                // Filter classes by selected date
                List<Data> filteredClasses = dataList.where((classData) {
                  if (classData.start == null) return false;
                  DateTime classDate = DateTime.parse(classData.start!);
                  return classDate.year == selectedDate.year &&
                      classDate.month == selectedDate.month &&
                      classDate.day == selectedDate.day;
                }).toList();

                if (filteredClasses.isEmpty) {
                  return const Center(child: Text("No classes available on this date"));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: filteredClasses.length,
                  itemBuilder: (context, index) {
                    return ClassCard(
                      title: filteredClasses[index].title ?? "No Title",
                      tutor: filteredClasses[index].faculty ?? "No Faculty",
                      imageUrl: filteredClasses[index].avatar ?? "assets/images/ongoingcourse.png",
                      date: DateFormat("MMM dd, yyyy").format(DateTime.parse(filteredClasses[index].start!)),
                      startTime: DateFormat("h:mm a").format(DateTime.parse(filteredClasses[index].start!)),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Function to match month name from API with selected date
  bool _isMonthMatch(String monthName, DateTime date) {
    String formattedMonth = DateFormat('MMMM').format(date); // Convert selectedDate to month name
    return monthName.toLowerCase() == formattedMonth.toLowerCase();
  }
}

class ClassCard extends StatelessWidget {
  final String title;
  final String tutor;
  final String imageUrl;
  final String date;
  final String startTime;

  const ClassCard({
    required this.title,
    required this.tutor,
    required this.imageUrl,
    required this.date,
    required this.startTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppConstant.cardBackground,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image section - Fixed width
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 80, // Fixed width for image to prevent expansion
                height: 80,
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),

            /// Text section - Flexible width
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    tutor,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),

                  /// Updated Recorded Info Row (Replaced with Date)
                  Row(
                    children:  [
                      Icon(FluentIcons.clock_24_regular,
                          size: 18, color: Colors.blue),
                      SizedBox(width: 4),
                      Text(startTime,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Icon(FluentIcons.calendar_24_regular,
                          color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text(date,
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold)),
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
