import 'package:alpha/constants/config.dart';
import 'package:alpha/features/subscribed_courses/screen/chapter_contents.dart';
import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
import 'package:alpha/models/chapter_list_model.dart';
import 'package:flutter/material.dart';

class ChapterList extends StatefulWidget {
  final String sublectImage;
  final String subjectName;
  final String classId;
  final String packageId;
  final String batchId;
  final String subjectId;
  const ChapterList({
    required this.sublectImage,
    required this.subjectName,
    required this.classId,
    required this.packageId,
    required this.batchId,
    required this.subjectId,
    super.key,
  });

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.subjectName,
                style: TextStyle(color: Colors.black),
              ),
              background: Image.network(
                widget.sublectImage,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new,
                  size: 16, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverFillRemaining(
            child: SafeArea(
              child: Container(
                color: Colors.white, // Set the background color to white
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
                    return ListView.builder(
                      padding: const EdgeInsets.all(3),
                      itemCount: snapshot.data!.chapters!.length,
                      itemBuilder: (context, index) {
                        final list = snapshot.data!.chapters![index];
                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                          elevation: 3,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 12.0, bottom: 12.0),
                            child: ListTile(
                              title: Text(
                                list.chaptersName ?? "Chapter",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.network(
                                  list.chaptersImage ??
                                      "assets/images/course1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChapterContents(
                                      chapterImage: list.chaptersImage!,
                                      chapterName: list.chaptersName!,
                                      chapterId: list.chaptersId!,
                                      batchId: widget.batchId,
                                      packageId: widget.packageId,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
