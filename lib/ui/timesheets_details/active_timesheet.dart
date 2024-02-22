import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'package:flutter_test_sample/ui/widgets/card.dart';

import '../../data/data_utils.dart';
import '../widgets/accent_border.dart';
import '../widgets/timer_main_screen.dart';
import 'selection_bloc/bloc.dart';

class ActiveTimesheet extends StatelessWidget {
  final TimeSheetModel timesheet;

  const ActiveTimesheet(this.timesheet, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
        child: GestureDetector(
      onTap: () {
        context.read<TimesheetSelectedBloc>().add(TimesheetsSelect(timesheet));
        DefaultTabController.of(context).animateTo(1);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(getDayOfWeak(timesheet.project.startDate),
              style: Theme.of(context).textTheme.bodySmall),
          Text(getDateFormatted(timesheet.project.startDate),
              style: Theme.of(context).textTheme.titleMedium),
          Text("Start time 10:00",
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 10),
          TimerWidget(
            timesheet: timesheet,
            showSeconds: true,
            detailed: true,
          ),
          const SizedBox(height: 16),
          const HorizontalBorder(),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Description",
                  style: Theme.of(context).textTheme.bodySmall),
              Text(timesheet.project.description,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium),
              Text("Read more", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    ));
  }
}
