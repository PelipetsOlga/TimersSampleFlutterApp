import 'dart:typed_data';

import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';

Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage) {
  Analytics().log("ShowCapturedWidget: $capturedImage");
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text("Captured widget screenshot"),
      ),
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Image.memory(capturedImage)),
        ),
      ),
    ),
  );
}