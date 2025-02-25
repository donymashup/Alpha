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
    double screenWidth = MediaQuery.of(context).size.width;

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

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth < 600 ? 2 : 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
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
                            subjectId: subject.subjectId!),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.network(
                              subject.subjectImage ??
                                  'assets/images/subject_bg.jpg', // Default image
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/subject_bg.jpg',
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                        // Subject Name Below Image
                        Container(
                          decoration: BoxDecoration(
                            color: AppConstant.cardBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          child: Text(
                            subject.subjectName ?? "Subject",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
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
