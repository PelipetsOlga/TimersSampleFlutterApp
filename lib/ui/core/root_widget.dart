import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../projects/projects_widgets.dart';
import '../settings/settings_widgets.dart';
import '../timesheets/timesheets_widgets.dart';

part 'nav_bar_widget.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Theme.of(context).colorScheme.tertiaryContainer,
              Theme.of(context).colorScheme.onTertiaryContainer,
            ]),
      ),
      child: Scaffold(
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
          const TimesheetsWidget(),
          const ProjectsWidget(),
          const SettingsWidget(),
        ][currentPageIndex],
      ),
    );
  }
}
