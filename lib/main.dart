import 'dart:io';

import 'package:analytics/analytics.dart';
import 'package:flutter/material.dart';
import 'package:analytics/analytics_widget.dart';

import 'di/di.dart';
import 'ui/core/app_widget.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initDI();
  var path = await _localPath();
  Analytics().log("main start path=$path");
  runApp(AnalyticsWidget(const MyApp(), path));
}

Future<String> _localPath() async {
  if (Platform.isAndroid) {
    return (await getExternalStorageDirectory())?.path??"empty android path";  // OR return "/storage/emulated/0/Download";
  } else {
    return (await getApplicationDocumentsDirectory()).path;
  }
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
