import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewPage extends StatefulWidget {
  const PdfViewPage({Key? key, required this.pdfUrl}) : super(key: key);
  final String pdfUrl;

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pdfViewerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SfPdfViewer.network(
          widget.pdfUrl,
          key: _pdfViewerKey,
          controller: _pdfViewerController,
          onDocumentLoadFailed: (c){print(c.description);},
        ),
      ),
    );
  }
}
