import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/subscribed_courses/screen/chapter_list.dart';
import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
import 'package:alpha/features/subscribed_courses/widgets/suscribed_appbar.dart';
import 'package:alpha/models/subject_list_model.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  final String classId;
  final String packageId;
  final String batchId;
  final String className;
  const SubjectList({
    required this.classId,
    required this.packageId,
    required this.batchId,
    required this.className,
    super.key,
  });

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  late Future<SubjectListModel?> _subjectList;

  @override
  void initState() {
    super.initState();
    _subjectList = UserSubscriptionsServices().getCourseSubjectList(
      context: context,
      classId: widget.classId,
      packageId: widget.packageId,
      batchId: widget.batchId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SubscribedAppBar(title: widget.className),
      ),
      body: SafeArea(
        child: FutureBuilder<SubjectListModel?>(
          future: _subjectList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData ||
                snapshot.data!.subjects == null ||
                snapshot.data!.subjects!.isEmpty) {
              return const Center(child: Text("No subjects found"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: snapshot.data!.subjects!.length,
              itemBuilder: (context, index) {
                final subject = snapshot.data!.subjects![index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChapterList(
                          sublectImage: subject.subjectImage!,
                          subjectName: subject.subjectName!,
                          classId: widget.classId,
                          packageId: subject.packageid!,
                          batchId: widget.batchId,
                          subjectId: subject.subjectId!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              subject.subjectImage ??
                                  'assets/images/onboarding1.jpg', // Default image
                              width: 110,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/onboarding1.jpg',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 12), // Space between image and text
                          Expanded(
                            child: Text(
                              subject.subjectName ?? "Subject",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
