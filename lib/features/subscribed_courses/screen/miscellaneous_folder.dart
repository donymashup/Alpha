// import 'package:alpha/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:alpha/features/subscribed_courses/services/user_subscriptions_services.dart';
// import 'package:alpha/models/miscellaneous_folder_model.dart';

// class MiscellaneousScreen extends StatefulWidget {
//   final String courseId;
//   final String packageId;

//   const MiscellaneousScreen({
//     Key? key,
//     required this.courseId,
//     required this.packageId,
//   }) : super(key: key);

//   @override
//   _MiscellaneousScreenState createState() => _MiscellaneousScreenState();
// }

// class _MiscellaneousScreenState extends State<MiscellaneousScreen> {
//   late Future<MiscellaneousFoldersModel?> folders;

//   @override
//   void initState() {
//     super.initState();
//     fetchInitialFolders();
//   }

//   void fetchInitialFolders() {
//     setState(() {
//       folders = UserSubscriptionsServices().getMiscellaneousFolders(
//         context: context,
//         courseId: widget.courseId,
//         userId: userData.userid, // Assuming `userData` is globally available
//         packageId: widget.packageId,
//       );
//       print(folders.toString());
//     });
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
//             return const Center(
//               child: Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Text("No chapters found"),
//               ),
//             );
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.list!.length,
//             itemBuilder: (context, index) {
//               var folder = snapshot.data!.list![index];
//               return ListTile(
//                 title: Text(folder.title ?? "No Title"),
//                 leading: folder.thumbnail != null
//                     ? Image.network(folder.thumbnail!, width: 50, height: 50, fit: BoxFit.cover)
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
