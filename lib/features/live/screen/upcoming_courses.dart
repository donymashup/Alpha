import 'package:alpha/features/live/services/live_service.dart';
import 'package:alpha/models/live_model.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:intl/intl.dart';

class UpcomingCourses extends StatefulWidget {
  const UpcomingCourses({super.key});

  @override
  State<UpcomingCourses> createState() => _UpcomingCoursesState();
  
}

class _UpcomingCoursesState extends State<UpcomingCourses> {
   final LiveService _liveService = LiveService(); // Initialize LiveService

  Future<LiveModel?>? _liveClassFuture; // Future to hold API response

  @override
  void initState() {
    super.initState();
    _fetchLiveClasses();
  }

  void _fetchLiveClasses() {
    setState(() {
      _liveClassFuture = _liveService.getLiveClass(
        context: context,
      );
    });
  }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: SizedBox(
//         width: double.infinity,
//         child: ListView(
//           shrinkWrap: true,
//           physics: const BouncingScrollPhysics(),
//           children: const [
//             ClassCard(
//               title: "Basics of Algebra",
//               tutor: "Mathematics",
//               imageUrl: "assets/images/ongoingcourse.png",
//               date: "Feb 10, 2025",
//               startTime: "10:00 AM",
//             ),
//             ClassCard(
//               title: "Basics of Lights",
//               tutor: "Science",
//               imageUrl: "assets/images/ongoingcourse1.png",
//               date: "Feb 12, 2025",
//               startTime: "2:00 PM",
//             ),
//             ClassCard(
//               title: "Basics of Trigonometry",
//               tutor: "Mathematics",
//               imageUrl: "assets/images/ongoingcourse2.png",
//               date: "Feb 15, 2025",
//               startTime: "4:30 PM",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: FutureBuilder<LiveModel?>(
          future: _liveClassFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator()); // Show loading
            } else if (snapshot.hasError || snapshot.data == null) {
              return const Center(child: Text("Failed to load upcoming classes"));
            } else if (snapshot.data! == null || snapshot.data!.upcoming!.isEmpty) {
              return const Center(child: Text("No upcoming classes available"));
            }

            // Extract upcoming classes
            List<Upcoming> upcomingClasses = snapshot.data!.upcoming!;

            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: upcomingClasses.length,
              itemBuilder: (context, index) {
                final classData = upcomingClasses[index];

                return ClassCard(
                  title: classData.title ?? "No Title",
                  tutor: classData.faculty ?? "No Faculty",
                  imageUrl: classData.avatar ?? "assets/images/ongoingcourse.png", // Replace with dynamic image if available
                  date: classData.end != null ? DateFormat("MMM dd, yyyy").format(DateTime.parse(classData.start!)) : "No Date",
                  startTime: classData.end != null ? DateFormat("h:mm a").format(DateTime.parse(classData.start!)) : "No Time",
                );
              },
            );
          },
        ),
      ),
    );
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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image section - Fixed width
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 80, // Fixed width for image
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
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    tutor,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),

                  /// Date and Start Time Row
                  Row(
                    children: [
                      Icon(FluentIcons.calendar_ltr_24_regular, size: 18, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text(date, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Icon(FluentIcons.clock_24_regular, size: 18, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(startTime, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
