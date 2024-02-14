import 'package:equatable/equatable.dart';

import 'project.dart';
import 'time_sheet_record.dart';
import 'user.dart';

class TimeSheetModel extends Equatable {
  TimeSheetModel(this.id, this.user, this.project, this.favourite, this.timeRecord,
      this.inProgress);

  final int id;
  final UserModel user;
  final ProjectModel project;
  final bool favourite;
  final TimeRecordModel timeRecord;
  bool inProgress;

  @override
  List<Object> get props =>
      [id, user, project, favourite, timeRecord, inProgress];
}
