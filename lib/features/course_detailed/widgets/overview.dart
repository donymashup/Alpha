import 'package:alpha/constants/app_constants.dart';
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
        color: AppConstant.cardBackground,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children:[
           // SingleChildScrollView(
             // physics:  NeverScrollableScrollPhysics(),
             // child:
               WebViewWidget(controller: controller),
           //   ),
            loadindPercentage < 100 ?
            LinearProgressIndicator(
              color: AppConstant.primaryColor,
              value: loadindPercentage/100,
            ):Container()
            ] ),
        )
        ),
     );
       
  
  }  

}

