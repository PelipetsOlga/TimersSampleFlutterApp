import 'package:equatable/equatable.dart';
import 'package:flutter_test_sample/domain/models/project.dart';
import 'package:flutter_test_sample/domain/models/task.dart';

import 'timer_conter.dart';

class TimeSheetModel extends Equatable {
  TimeSheetModel({
    required this.id,
    required this.userId,
    required this.description,
    required this.project,
    required this.task,
    required this.favourite,
    required this.timer,
  });

  TimeSheetModel.create({
    required this.id,
    required this.userId,
    required this.description,
    required this.project,
    required this.task,
    required this.favourite,
  }) : timer = TimerModel.createStub();

  final String id;
  final String userId;
  final String description;
  final ProjectModel project;
  final TaskModel task;
  bool favourite;
  TimerModel timer;

  @override
  List<Object> get props =>
      [id, userId, description, project, task, favourite, timer];
}
