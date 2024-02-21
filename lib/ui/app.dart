import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_sample/ui/timesheet_create/create_timesheet.dart';
import 'package:flutter_test_sample/ui/timesheets_details/details_root_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/root_widget.dart';
import 'theme_wrapper_widget.dart';

part 'core/theme.dart';
part 'navigation.dart';

class AppTheme extends StatefulWidget {
  const AppTheme({super.key});


  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  ThemeMode themeMode = ThemeMode.system;

  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return View.of(context).platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: _lightTheme,
      darkTheme: _darkTheme,
    );
  }
}
