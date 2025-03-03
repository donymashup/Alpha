import 'package:alpha/features/subscribed_courses/screen/pdfview_screen.dart';
import 'package:alpha/models/material_model.dart';
import 'package:flutter/material.dart';

class MaterialsSectionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Future<MaterialsModel?> fetchFunction;

  const MaterialsSectionWidget({
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
        FutureBuilder<MaterialsModel?>(
          future: fetchFunction,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.materials!.isEmpty) {
              return const Text("No Data Available",
                  style: TextStyle(color: Colors.grey));
            }

            // Display the list of videos using ListView.builder
            return ListView.builder(
              shrinkWrap: true, // so that it takes minimal space
              physics: const NeverScrollableScrollPhysics(), // disable scrolling inside Column
              itemCount: snapshot.data!.materials!.length,
              itemBuilder: (context, index) {
                final material = snapshot.data!.materials![index];
                return Card(
                  color: const Color.fromARGB(255, 252, 255, 214),
                  child: ListTile(
                    title: Text(
                      material.materialListName?? "Material",
                      style: const TextStyle(fontSize: 14),
                    ),
                    subtitle: Text(
                      material.materialListDescription?? "Description",
                      style: const TextStyle(fontSize: 12),
                    ),
                    onTap: () {
                      // Open the PDF viewer screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFViewerPage(
                            pdfPath: material.materialListLink?? "",
                            materialName: material.materialListName?? "",
                          ),
                        ),
                      );
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
