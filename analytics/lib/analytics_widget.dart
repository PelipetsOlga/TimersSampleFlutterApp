import 'dart:io';

import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:screenshot/screenshot.dart';


import 'captured_widget.dart';

class AnalyticsWidget extends StatefulWidget {
  Widget content;
  String path;

  AnalyticsWidget(this.content, this.path, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AnalyticsWidgetState();
  }
}

class AnalyticsWidgetState extends State<AnalyticsWidget> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _makeScreenshots();
    return Screenshot(controller: screenshotController, child: widget.content);
  }

  void _makeScreenshots() async {
    screenshotController
        .captureAndSave( widget.path, fileName: "screenshot1.png", delay: const Duration(milliseconds: 2000))
        .then((capturedImage) async {
      Analytics().log(capturedImage?.toString() ?? 'empty screenshot');
      Analytics().log('path=${widget.path}');
      // ShowCapturedWidget(context, capturedImage!);
    }).catchError((onError) {
      print(onError);
    });
  }
}



// _saved(File image) async {
//   final result = await ImageGallerySaver.save(image.readAsBytesSync());
//   print("File Saved to Gallery");
// }
