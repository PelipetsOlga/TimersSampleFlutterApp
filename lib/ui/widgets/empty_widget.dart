import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_sample/ui/widgets/primary_button.dart';

String _emptyProjectsIcon = 'assets/projects_empty.svg';
String _emptyProjectsTitle = 'You don\'t have any projects from odoo';
String _emptyProjectsDescription = 'Synchronize with odoo to get started';

String _emptyProjectsFavIcon = 'assets/favourites_empty.svg';
String _emptyProjectsFavTitle = 'No favorite projects yet';
String _emptyProjectsFavDescription =
    'You can mark a project as favorite either on the timer creation page or within an existing project';

String _emptyTimesheetsIcon = 'assets/timesheets_empty.svg';
String _emptyTimesheetsTitle = 'You don\'t have any odoo timesheets';
String _emptyTimesheetsDescription = 'Synchronize with odoo to get started';

String _emptyTimesheetsFavIcon = 'assets/favourites_empty.svg';
String _emptyTimesheetsFavTitle = 'No favorited timers yet';
String _emptyTimesheetsFavDescription =
    'You can mark a timer as favorite either on the timer creation page or within an existing timer';

class EmptyContentWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  final String title;
  final String description;

  const EmptyContentWidget(
      this.icon, this.title, this.description, this.onPressed,
      {super.key});

  EmptyContentWidget.emptyProjects(this.onPressed, {super.key})
      : icon = _emptyProjectsIcon,
        title = _emptyProjectsTitle,
        description = _emptyProjectsDescription;

  EmptyContentWidget.emptyFavouriteProjects(this.onPressed, {super.key})
      : icon = _emptyProjectsFavIcon,
        title = _emptyProjectsFavTitle,
        description = _emptyProjectsFavDescription;

  EmptyContentWidget.emptyTimesheets(this.onPressed, {super.key})
      : icon = _emptyTimesheetsIcon,
        title = _emptyTimesheetsTitle,
        description = _emptyTimesheetsDescription;

  EmptyContentWidget.emptyFavouriteTimesheets(this.onPressed, {super.key})
      : icon = _emptyTimesheetsFavIcon,
        title = _emptyTimesheetsFavTitle,
        description = _emptyTimesheetsFavDescription;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 20, height: 8),
          IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(icon),
                const SizedBox(width: 20, height: 32),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 8),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(text: "Get Started", onPressed: onPressed),
          ),
        ],
      ),
    );
  }
}
