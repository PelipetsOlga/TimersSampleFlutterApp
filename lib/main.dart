import 'package:flutter/material.dart';
import 'package:analytics/analytics.dart';

import 'di/di.dart';
import 'ui/core/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDI();
  Analytics().log("main start");
  runApp( MyApp());
}

