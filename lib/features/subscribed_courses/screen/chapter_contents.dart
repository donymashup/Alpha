import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
import 'package:alpha/features/subscribed_courses/widgets/materials_section.dart';
import 'package:alpha/features/subscribed_courses/widgets/practice_test_section.dart';
import 'package:alpha/features/subscribed_courses/widgets/videos_section.dart';
import 'package:flutter/material.dart';

class ChapterContents extends StatefulWidget {
  final String chapterImage;
  final String chapterName;
  final String chapterId;
  final String batchId;
  final String packageId;

  const ChapterContents({
    super.key,
    required this.chapterId,
    required this.batchId,
    required this.packageId,
    required this.chapterName,
    required this.chapterImage,
  });

  @override
  State<ChapterContents> createState() => _ChapterContentsState();
}

class _ChapterContentsState extends State<ChapterContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   expandedHeight: 200.0,
          //   floating: false,
          //   pinned: true,
          //   snap: false,
          //   backgroundColor: Colors.white,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text(
          //       widget.chapterName,
          //       style: TextStyle(color: Colors.black),
          //     ),
          //     background: Image.network(
          //       widget.chapterImage,
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   leading: IconButton(
          //     icon: const Icon(Icons.arrow_back_ios_new,
          //         size: 16, color: Colors.black),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
           SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Colors.white,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {

                bool isCollapsed = constraints.maxHeight <= kToolbarHeight;
                return Stack(
                  fit: StackFit.expand,
                  children: [
              
                    Image.network(
                          widget.chapterImage,
                          fit: BoxFit.cover,
                        ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.transparent, 
                          ],
                        ),
                      ),
                    ),

                    // Title centered at the bottom when expanded, in the toolbar when collapsed
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35, bottom: 10),
                        child: Text(
                          widget.chapterName,
                          style: TextStyle(
                            color: Colors.white, 
                            fontSize: isCollapsed ? 18 : 20, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Videos Section
                VideoSectionWidget(
                  icon: Icons.video_library,
                  title: "Videos",
                  fetchFunction: UserSubscriptionsServices().getChapterVideos(
                      context: context,
                      chapterId: widget.chapterId,
                      batchId: widget.batchId,
                      packageId: widget.packageId),
                ),
                Divider(),
                // Study Material Section
                MaterialsSectionWidget(
                  icon: Icons.book,
                  title: "Study Materials",
                  fetchFunction: UserSubscriptionsServices()
                      .getChapterMaterials(
                          context: context,
                          chapterId: widget.chapterId,
                          batchId: widget.batchId,
                          packageId: widget.packageId),
                ),
                Divider(),
                // Quizzes Section
                PracticeTestSection(
                  icon: Icons.quiz,
                  title: "Practice tests",
                  fetchFunction: UserSubscriptionsServices()
                      .getChapterPracticeTests(
                          context: context,
                          chapterId: widget.chapterId,
                          batchId: widget.batchId,
                          packageId: widget.packageId),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
