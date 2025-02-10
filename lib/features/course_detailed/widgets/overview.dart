// import 'package:alpha/constants/app_constants.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

// class OverviewCard extends StatelessWidget {
//   final String courseOverview = '''
// # Course Overview

// Welcome to the **Flutter Development** course!
// ![Flutter Course](assets/images/flutter_courses.png)

// In this course, we will cover the following topics:

// 1. **Introduction to Flutter**
//    - Overview of Flutter framework
//    - Setting up your development environment

// 2. **Building UI**
//    - Using Flutter widgets like `Container`, `Row`, `Column`
//    - Creating beautiful and responsive layouts

// 3. **State Management**
//    - Understanding various state management techniques
//    - Using providers, Riverpod, and setState

// 4. **Backend Integration**
//    - Integrating Firebase with Flutter
//    - Communicating with APIs

// ### Key Takeaways:
 
// - You will learn how to build mobile apps with a rich user interface.
// - You will become proficient in Dart and Flutter tools.
  
// > "Learning Flutter is a gateway to building modern apps!" - Instructor
//   ''';
//  InAppWebViewController? webViewController;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: AppConstant.cardBackground,
//       margin: EdgeInsets.all(16.0),
//       elevation: 8.0,
//       child: Center(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             physics: ClampingScrollPhysics(),
//             child: InAppWebView(
//                     initialUrlRequest: URLRequest(
//             url: WebUri("https://flutter.dev"),  // ✅ Convert to WebUri
//                     ),
//                     gestureRecognizers: {
//                 Factory<OneSequenceGestureRecognizer>(
//                     () => EagerGestureRecognizer()), // ✅ Enables WebView scrolling
//               },
//             //         onWebViewCreated: (controller) {
//             // webViewController = controller;
//             //         },
//                   ),
//           ),
//           // child: Markdown(
//           //   data: courseOverview,
//           //   styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
//           //     h1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           //     h2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           //     p: TextStyle(fontSize: 16),
//           //     blockquote: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey),
//           //   ),
//           // ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class OverviewCard extends StatefulWidget {
//   const OverviewCard({super.key});

//   @override
//   _OverviewCardState createState() => _OverviewCardState();
// }

// class _OverviewCardState extends State<OverviewCard> {
//   late WebViewController _webViewController;
//   bool _isWebViewReady = false;

//   @override
//   void initState() {
//     super.initState();

//     // ✅ Initialize WebView in Future.microtask to prevent assertion errors
//     Future.microtask(() async {
//       final controller = WebViewController()
//         ..setJavaScriptMode(JavaScriptMode.unrestricted) // ✅ Enable JavaScript
//         ..setBackgroundColor(Colors.transparent)
//         ..loadRequest(Uri.parse("https://flutter.dev")); // ✅ Load URL

//       setState(() {
//         _webViewController = controller;
//         _isWebViewReady = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(16.0),
//       elevation: 8.0,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           height: 400, // ✅ Set appropriate height
//           child: _isWebViewReady
//               ? WebViewWidget(controller: _webViewController)
//               : const Center(child: CircularProgressIndicator()), // ✅ Show loader until ready
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class OverviewTab extends StatefulWidget {
//   @override
//   _OverviewTabState createState() => _OverviewTabState();
// }

// class _OverviewTabState extends State<OverviewTab> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(Uri.parse("https://www.google.com")); // Change this to your URL
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//        SizedBox(
//   height: MediaQuery.of(context).size.height * 0.3, // 80% of screen height
//   child: WebViewWidget(controller: _controller),
// ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OverviewTab extends StatefulWidget {
  @override
  _OverviewTabState createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  late  WebViewController controller;
  var loadindPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController() 
    ..setNavigationDelegate(NavigationDelegate(
      onPageStarted: (url) {
        setState(() {
          loadindPercentage = 0;
        });
      },
      onProgress: (progress) {
        setState(() {
          loadindPercentage = progress;
        });
      },
      onPageFinished: (url) {
        setState(() {
          loadindPercentage = 100;
        });
      },
    )) 
    ..loadRequest(Uri.parse("https://flutter.dev")); // Change this to your URL
  }

  @override
  Widget build(BuildContext context) {
    return
     Expanded(
       child: Card(
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WebViewWidget(controller: controller),
        )
        ),
     );
       
  
  }  
}

