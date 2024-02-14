import 'package:equatable/equatable.dart';

import 'project.dart';
import 'time_sheet_record.dart';
import 'user.dart';

class TimeSheet extends Equatable {
  TimeSheet(this.id, this.user, this.project, this.favourite, this.timeRecord,
      this.inProgress);

  final int id;
  final User user;
  final Project project;
  final bool favourite;
  final TimeRecord timeRecord;
  bool inProgress;

  @override
  List<Object> get props =>
      [id, user, project, favourite, timeRecord, inProgress];
}
