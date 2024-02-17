import 'package:equatable/equatable.dart';

import '../../data/models/project.dart';
import 'time_sheet_record.dart';

class TimeSheetModel extends Equatable {
  TimeSheetModel({
    required this.id,
    required this.userId,
    required this.project,
    required this.favourite,
    required this.timeRecord,
    required this.inProgress,
  });

  final String id;
  final String userId;
  final Project project;
  bool favourite;
  final TimeRecordModel timeRecord;
  bool inProgress;

  @override
  List<Object> get props =>
      [id, userId, project, favourite, timeRecord, inProgress];
}
