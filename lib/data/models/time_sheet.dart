import 'package:json_annotation/json_annotation.dart';

import 'project.dart';
import 'time_record.dart';
import 'user.dart';

part 'time_sheet.g.dart';

@JsonSerializable()
class TimeSheet {
  TimeSheet({
    required this.id,
    required this.user,
    required this.project,
    required this.favourite,
    required this.timeRecord,
    required this.inProgress,
  });

  factory TimeSheet.fromJson(Map<String, dynamic> json) =>
      _$TimeSheetFromJson(json);

  final int id;
  final User user;
  final Project project;
  final bool favourite;
  final TimeRecord timeRecord;
  final bool inProgress;

  Map<String, dynamic> toJson() => _$TimeSheetToJson(this);
}
