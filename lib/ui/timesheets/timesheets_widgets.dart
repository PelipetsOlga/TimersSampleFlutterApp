import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_sample/ui/timesheets/timesheets_bloc/bloc.dart';

import '../../data/data_utils.dart';
import '../../domain/models/time_sheet.dart';
import '../widgets/accent_border.dart';
import '../widgets/star_checkbox.dart';

class TimesheetsWidget extends StatelessWidget {
  List<TimeSheetModel> timesheets;

  TimesheetsWidget({required this.timesheets, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: ListView.builder(
        itemCount: timesheets.length,
        itemBuilder: (BuildContext context, int index) {
          return TimesheetWidget(timesheets[index]);
        },
      ),
    );
  }
}

class TimesheetWidget extends StatelessWidget {
  final TimeSheetModel timesheet;

  const TimesheetWidget(this.timesheet, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white.withOpacity(0.08),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const AccentVerticalBorder(height: 80),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        StarCheckbox(
                          isChecked: timesheet.favourite,
                          onChange: (value) {
                            context.read<TimesheetsBloc>().add(TimesheetsLike(
                                  timesheetId: timesheet.id,
                                  like: value,
                                ));
                          },
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            timesheet.project.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ]),
                      const SizedBox(height: 4),
                      Row(children: [
                        SvgPicture.asset("assets/project_small.svg"),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            timesheet.project.number,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ]),
                      Row(children: [
                        SvgPicture.asset("assets/clock_small.svg"),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Deadline ${getDate(timesheet.project.deadline)}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ]),
                    ]),
              ),
            ],
          ),
        ));
  }
}
