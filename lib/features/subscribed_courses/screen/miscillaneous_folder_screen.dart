// import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
// import 'package:alpha/models/miscellaneous_folder_model.dart';
// import 'package:flutter/material.dart';

// class MiscillaneousFolderScreen extends StatefulWidget {
//   const MiscillaneousFolderScreen({super.key});

//   @override
//   State<MiscillaneousFolderScreen> createState() => _MiscillaneousFolderScreenState();
// }

// class _MiscillaneousFolderScreenState extends State<MiscillaneousFolderScreen> {
//   late Future<MiscellaneousFoldersModel?> folders;

//   void fetchInitialFolders() {
//     setState(() {
//       folders = UserSubscriptionsServices().getMiscellaneousFolders(
//         context: context,
//         courseId: "1",
//         userId: "1", // Assuming `userData` is globally available
//         packageId: "1",
//       );
//       print(folders.toString());
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchInitialFolders();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Miscellaneous Folders"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       // body: Text("data"),
//       body: FutureBuilder<MiscellaneousFoldersModel?>(
//         future: folders,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Text("Error: ${snapshot.error}"),
//               ),
//             );
//           } else if (!snapshot.hasData ||
//               snapshot.data!.list == null ||
//               snapshot.data!.list!.isEmpty) {
//             if (snapshot.data?.list == null || snapshot.data!.list!.isEmpty) {
//               return const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Text("No chapters found"),
//                 ),
//               );
//             }
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.list!.length,
//             itemBuilder: (context, index) {
//               var folder = snapshot.data!.list![index];
//               return ListTile(
//                 title: Text(folder.title ?? "No Title"),
//                 leading: folder.thumbnail != null
//                     ? Image.network(folder.thumbnail!,
//                         width: 50, height: 50, fit: BoxFit.cover)
//                     : const Icon(Icons.folder, size: 50), // Fallback icon
//                 onTap: () {
//                   // Handle folder click
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
import 'package:alpha/models/miscellaneous_folder_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MiscellaneousFolderScreen extends StatefulWidget {
  const MiscellaneousFolderScreen({super.key});

  @override
  State<MiscellaneousFolderScreen> createState() => _MiscellaneousFolderScreenState();
}

class _MiscellaneousFolderScreenState extends State<MiscellaneousFolderScreen> {
  late Future<MiscellaneousFoldersModel?> folders;
  MiscellaneousFoldersModel? currentFolder; // Track the selected folder

  @override
  void initState() {
    super.initState();
    fetchInitialFolders();
  }

  void fetchInitialFolders() {
    setState(() {
      folders = UserSubscriptionsServices().getMiscellaneousFolders(
        context: context,
        courseId: "1",
        userId: "1",
        packageId: "1",
      );
    });
  }

  void updateFolder(MiscellaneousFoldersModel selectedFolder) {
    setState(() {
      currentFolder = selectedFolder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentFolder == null ? "Miscellaneous Folders" : currentFolder!.title ?? "Subfolder"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (currentFolder != null) {
              setState(() {
                currentFolder = null; // Go back to the root level
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: FutureBuilder<MiscellaneousFoldersModel?>(
        future: folders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.list == null || snapshot.data!.list!.isEmpty) {
            return const Center(child: Text("No folders found"));
          }

          // Determine which list to show
          List<MiscellaneousFoldersModel> displayList = currentFolder?.list ?? snapshot.data!.list!;

          return ListView.builder(
            itemCount: displayList.length,
            itemBuilder: (context, index) {
              var folder = displayList[index];

              return ListTile(
                title: Text(folder.title ?? "No Title"),
                leading: folder.thumbnail != null
                    ? CachedNetworkImage(
                    imageUrl: folder.thumbnail!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.broken_image, size: 50),
                     )
                   : Icon(Icons.folder, size: 50),
                trailing: folder.list != null && folder.list!.isNotEmpty ? Icon(Icons.arrow_back_ios_new) : null,
                onTap: () {
                  if (folder.list != null && folder.list!.isNotEmpty) {
                    updateFolder(folder);
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
