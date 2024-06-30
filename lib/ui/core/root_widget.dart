import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../projects/projects_root_widgets.dart';
import '../settings/settings_widgets.dart';
import '../timesheets/timesheets_root_widget.dart';

part 'nav_bar_widget.dart';

class RootSampleWidget extends StatefulWidget {
  const RootSampleWidget({super.key});

  @override
  State<RootSampleWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootSampleWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIndex: currentPageIndex,
        destinations: _destinations,
      ),
      body: <Widget>[
        TimesheetsRootWidget(),
        const ProjectsRootWidget(),
        const SettingsWidget(),
      ][currentPageIndex],
    );
  }
}
