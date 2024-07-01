import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

import '../app.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static GlobalKey previewContainer = GlobalKey();
  var counter = 5;

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    _makeScreenshots();
    return RepaintBoundary(key: previewContainer, child: const AppTheme());
  }

  void _makeScreenshots() async {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      print(timer.tick);
      takeScreenShot();
      counter--;
      if (counter == 0) {
        print('Cancel timer');
        timer.cancel();
      }
    });
  }

  Future<void> takeScreenShot() async {
    int startTime=_makeTimeStamp();
    final boundary = previewContainer.currentContext!.findRenderObject()
        as RenderRepaintBoundary;
    final image = await boundary.toImage();
    int imageTime=_makeTimeStamp();
    final directory = (await getApplicationDocumentsDirectory()).path;
    print("directory=$directory");
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData?.buffer.asUint8List();
    final imgFile = File('$directory/screenshot_$counter.png');
    imgFile.writeAsBytes(pngBytes!);
    print("imgFile=${imgFile.path}");
    int endTime=_makeTimeStamp();
    int imageDifTime=imageTime-startTime;
    int difTime=endTime-startTime;
    print("imageDifTime=$imageDifTime, difTime=$difTime");
  }
}

int _makeTimeStamp() {
  return DateTime.now().millisecondsSinceEpoch;
}
