import 'package:flutter/material.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'package:flutter_test_sample/domain/repositories/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../data/data_utils.dart';
import '../widgets/accent_border.dart';

class TimesheetSelectedDetailsWidget extends StatelessWidget {
  final TimeSheetModel timesheet;

  const TimesheetSelectedDetailsWidget(this.timesheet, {super.key});

  @override
  Widget build(BuildContext context) {
    var profile = GetIt.instance.get<AuthRepository>().profile();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
              color: Colors.white.withOpacity(0.08),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text("Project",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const AccentVerticalBorder(height: 20),
                        const SizedBox(width: 16),
                        Text("Apexive: ${timesheet.task.title}",
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text("Deadline",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(reformatDate(timesheet.task.deadline),
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text("Assigned to",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text("${profile.firstName} ${profile.lastName}",
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white.withOpacity(0.08),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Description",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 4),
                    Text(timesheet.project.description,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
