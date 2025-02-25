import 'package:alpha/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoSectionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Future<VideoModel?> fetchFunction;

  const VideoSectionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.fetchFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading with icon
        Row(
          children: [
            Icon(icon, color: Colors.red),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // FutureBuilder to fetch video data
        FutureBuilder<VideoModel?>(
          future: fetchFunction,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.videos!.isEmpty) {
              return const Text("No Data Available",
                  style: TextStyle(color: Colors.grey));
            }

            // Display the list of videos using ListView.builder
            return ListView.builder(
              shrinkWrap: true, // so that it takes minimal space
              physics: const NeverScrollableScrollPhysics(), // disable scrolling inside Column
              itemCount: snapshot.data!.videos!.length,
              itemBuilder: (context, index) {
                final video = snapshot.data!.videos![index];
                return Card(
                  color:  Color.fromARGB(255, 200, 255, 243),
                  child: ListTile(
                    leading: video.videoThumbnail != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              video.videoThumbnail ?? "",
                              width: 70,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.play_circle_fill, color: Colors.black54),
                    title: Text(
                      video.videoName ?? "Video",
                      style: const TextStyle(fontSize: 14),
                    ),
                    onTap: () {
                      // Navigate to the video detail page or play the video
                    },
                  ),
                );
              },
            );
          },
        ),

        const SizedBox(height: 12), // Space after section
      ],
    );
  }
}
