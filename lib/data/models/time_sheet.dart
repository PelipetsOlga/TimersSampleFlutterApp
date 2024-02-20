import 'package:flutter_test_sample/data/models/task.dart';
import 'package:flutter_test_sample/domain/models/timer_conter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'project.dart';

part 'time_sheet.g.dart';

@JsonSerializable()
class TimeSheet {
  TimeSheet({
    required this.id,
    required this.userId,
    required this.description,
    required this.project,
    required this.task,
    required this.favourite,
    required this.inProgress,
    required this.completed,
    required this.durationExpected,
    required this.durationActual,
    required this.state,
    required this.lastTickerStartTime,
  });

  factory TimeSheet.fromJson(Map<String, dynamic> json) =>
      _$TimeSheetFromJson(json);

  final String id;
  final String userId;
  final String description;
  final Project project;
  final Task task;
  final bool favourite;
  final bool inProgress;
  final bool completed;
  final int durationExpected;
  final int durationActual;
  final TimerState state;
  final int lastTickerStartTime;

  Map<String, dynamic> toJson() => _$TimeSheetToJson(this);
}
