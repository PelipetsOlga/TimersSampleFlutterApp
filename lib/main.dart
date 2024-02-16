import 'package:flutter/material.dart';

import 'di/di.dart';
import 'ui/core/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDI();
  runApp(const MyApp());
}

