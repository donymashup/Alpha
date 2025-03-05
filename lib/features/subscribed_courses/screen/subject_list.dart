import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/subscribed_courses/screen/chapter_list.dart';
import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
import 'package:alpha/features/subscribed_courses/widgets/suscribed_appbar.dart';
import 'package:alpha/models/subject_list_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.className),
                background: Image.asset(
                  'assets/images/coverpage.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFillRemaining(
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
                            child: CachedNetworkImage(
                            imageUrl: subject.subjectImage ?? "", // Use an empty string if null
                            width: 110,
                            height: 80,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 110,
                                height: 80,
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/onboarding1.jpg', // Default image on error
                              width: 110,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.grey.shade300),
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
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}