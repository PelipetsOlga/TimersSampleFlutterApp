import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/time_sheet.dart';
import 'active_timesheet.dart';
import 'completed_timesheet.dart';
import 'selection_bloc/bloc.dart';

class TimesheetsListWidget extends StatefulWidget {
  final List<TimeSheetModel> timesheetsActive;
  final List<TimeSheetModel> timesheetsCompleted;

  const TimesheetsListWidget(
      {super.key,
      required this.timesheetsActive,
      required this.timesheetsCompleted});

  @override
  State<StatefulWidget> createState() {
    return _TimesheetsListWidgetState();
  }
}

class _TimesheetsListWidgetState extends State<TimesheetsListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.timesheetsActive.firstOrNull != null) {
      context
          .read<TimesheetSelectedBloc>()
          .add(TimesheetsSelect(widget.timesheetsActive.first));
    }
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.timesheetsActive.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ActiveTimesheet(widget.timesheetsActive[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 16),
                child: Text(
                  "Completed Records",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.timesheetsCompleted.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CompletedTimesheet(
                        widget.timesheetsCompleted[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
