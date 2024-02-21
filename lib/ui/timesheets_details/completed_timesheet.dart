import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';

import '../../data/data_utils.dart';
import '../widgets/accent_border.dart';

String _checkIcon = 'assets/check_mark.svg';

class CompletedTimesheet extends StatelessWidget {
  final TimeSheetModel timesheet;

  const CompletedTimesheet(this.timesheet, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white.withOpacity(0.08),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
              backgroundColor: Colors.transparent,
              trailing: const SizedBox(),
              tilePadding: null,
              title: Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 8, right: 4),
                child: Row(
                  children: [
                    SvgPicture.asset(_checkIcon),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(getDayOfWeak(timesheet.project.startDate),
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(getDateFormatted(timesheet.project.startDate),
                            style: Theme.of(context).textTheme.titleMedium),
                        Text("Start time 10:00",
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    const Expanded(child: SizedBox(width: 16)),
                    Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          border: Border.all(color: Colors.black, width: 0.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(64)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          child: Text(
                              _formattedTime(timesheet.timer.durationExpected)),
                        )),
                  ],
                ),
              ),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const HorizontalBorder(),
                      const SizedBox(height: 16),
                      Text("Description",
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(height: 4),
                      Text(timesheet.project.description,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ]),
        ));
  }
}

String _formattedTime(int timeInMillis) {
  int timeInSecond = timeInMillis ~/ 1000;
  int minRaw = (timeInSecond / 60).floor();
  int h = (timeInSecond / (60 * 60)).floor();
  int min = minRaw - (h * 60);
  String hours = h.toString().length <= 1 ? "0$h" : "$h";
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  return "$hours:$minute";
}
