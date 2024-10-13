import 'package:cux_analytics_sdk/analytics_sdk.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    CuxAnalytics.init(context, '1428112091.0.46456300.1480349278.583c565e0fc5d');
    return AnalyticsWidget(child: const AppTheme());
  }
}
