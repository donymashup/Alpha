import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatelessWidget {
  final String pdfPath; 
  final String materialName;

  const PDFViewerPage({super.key, required this.pdfPath, required this.materialName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(materialName,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),)),
      body:
      SfPdfViewer.network(pdfPath),
      );
    
  }
}
