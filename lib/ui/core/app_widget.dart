import 'package:flutter/material.dart';

import '../app.dart';
import 'root_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppTheme(
      key: key,
      childWidget: const RootWidget(),
    );
  }
}
