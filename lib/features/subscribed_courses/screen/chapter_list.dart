import 'package:alpha/constants/config.dart';
import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
import 'package:alpha/features/subscribed_courses/widgets/materials_section.dart';
import 'package:alpha/features/subscribed_courses/widgets/practice_test_section.dart';
import 'package:alpha/features/subscribed_courses/widgets/videor_section.dart';
import 'package:alpha/models/chapter_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ChapterList extends StatefulWidget {
  final String sublectImage;
  final String subjectName;
  final String classId;
  final String packageId;
  final String batchId;
  final String subjectId;
  const ChapterList(
      {required this.sublectImage,
      required this.subjectName,
      required this.classId,
      required this.packageId,
      required this.batchId,
      required this.subjectId,
      super.key});

  @override
  State<ChapterList> createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  late Future<ChapterListModel?> _chapterList;

  @override
  void initState() {
    super.initState();
    _chapterList = UserSubscriptionsServices().getSubjectChapterList(
      context: context,
      classId: widget.classId,
      packageId: widget.packageId,
      batchId: widget.batchId,
      subjectId: widget.subjectId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.subjectName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 16),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: FutureBuilder<ChapterListModel?>(
            future: _chapterList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData ||
                  snapshot.data!.chapters == null ||
                  snapshot.data!.chapters!.isEmpty) {
                return const Center(child: Text("No chapters found"));
              }
              return ClipRRect(
                 borderRadius: BorderRadius.circular(12),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10), 
                  itemCount: snapshot.data!.chapters!.length,
                  itemBuilder: (context, index) {
                    final list = snapshot.data!.chapters![index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: ExpansionTile(
                        title: Text(
                          list.chaptersName ?? "Chapter",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              8), // Rounded corners for the image
                          child: Image.network(
                            list.chaptersImage ??
                                "assets/images/course1.png", 
                            width: 90,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        tilePadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        backgroundColor: Colors.white, // White background
                        collapsedBackgroundColor:
                            Colors.white, // White when collapsed
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.red, width: 3), // Red border
                          borderRadius: BorderRadius.circular(12),
                        ),
                        children: [
                        //  Videos Section
                          VideoSectionWidget(
                          icon: Icons.video_library,
                          title: "Videos",
                          fetchFunction: UserSubscriptionsServices().getChapterVideos(
                            context: context, 
                            chapterId: list.chaptersId!, 
                            batchId: widget.batchId, 
                            packageId: widget.packageId),
                        ),
                        Divider(),
                        // /Study Material Section
                        MaterialsSectionWidget(
                          icon: Icons.book,
                          title: "Study Materials",
                          fetchFunction: UserSubscriptionsServices().getChapterMaterials(
                            context: context,
                             chapterId: list.chaptersId!,
                              batchId: widget.batchId, 
                              packageId:widget.packageId),
                        ),
                         Divider(),
                        //  Quizzes Section
                       PracticeTestSection(
                          icon: Icons.quiz,
                          title: "Practice tests",
                          fetchFunction: UserSubscriptionsServices().getChapterPracticeTests(
                            context: context, 
                            chapterId: list.chaptersId!, 
                            batchId: widget.batchId, 
                            packageId: widget.packageId),
                        ),
                      ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ));
  }
}
