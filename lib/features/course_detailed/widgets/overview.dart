
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/selected_course_controller.dart';
import 'package:alpha/models/available_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class OverviewTab extends StatefulWidget {
//   @override
//   _OverviewTabState createState() => _OverviewTabState();
// }

// class _OverviewTabState extends State<OverviewTab> {
//   late  WebViewController controller;
//   var loadindPercentage = 0;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController() 
//     ..setNavigationDelegate(NavigationDelegate(
//       onPageStarted: (url) {
//         setState(() {
//           loadindPercentage = 0;
//         });
//       },
//       onProgress: (progress) {
//         setState(() {
//           loadindPercentage = progress;
//         });
//       },
//       onPageFinished: (url) {
//         setState(() {
//           loadindPercentage = 100;
//         });
//       },
//     )) 
//     ..loadRequest(Uri.parse("https://flutter.dev")); // Change this to your URL
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//      Expanded(
//        child: Card(
//         color: AppConstant.cardBackground,
//         margin: EdgeInsets.all(8),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Stack(children:[
//            // SingleChildScrollView(
//              // physics:  NeverScrollableScrollPhysics(),
//              // child:
//                WebViewWidget(controller: controller),
//            //   ),
//             loadindPercentage < 100 ?
//             LinearProgressIndicator(
//               color: AppConstant.primaryColor,
//               value: loadindPercentage/100,
//             ):Container()
//             ] ),
//         )
//         ),
//      );
       
  
//   }  

// }
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';

class OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CourseDetails? courseDetails = Get.find<CourseController>().selectedCourse.value;
    final description = courseDetails?.description ?? "No description available";
    print(description);

    return Expanded(
      child: Card(
        color: AppConstant.cardBackground,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Html(
              data: description,  // Directly rendering HTML content
              style: {
                "p": Style(fontSize: FontSize.medium),
                "h3": Style(fontSize: FontSize.large, fontWeight: FontWeight.bold),
              },
            ),
          ),
        ),
      ),
    );
  }
}
