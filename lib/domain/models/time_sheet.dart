import 'package:equatable/equatable.dart';
import 'package:flutter_test_sample/domain/models/project.dart';
import 'package:flutter_test_sample/domain/models/task.dart';


class TimeSheetModel extends Equatable {
  TimeSheetModel({
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
  });

  TimeSheetModel.create({
    required this.id,
    required this.userId,
    required this.description,
    required this.project,
    required this.task,
    required this.favourite,
  })  : inProgress = false,
        completed = false,
        durationExpected = 2 * 30 * 24 * 60 * 60 * 1000,
        durationActual = 0;

  final String id;
  final String userId;
  final String description;
  final ProjectModel project;
  final TaskModel task;
  bool favourite;
  bool inProgress;
  bool completed;
  int durationExpected;
  int durationActual;

  @override
  List<Object> get props => [
        id,
        userId,
        description,
        project,
        task,
        favourite,
        inProgress,
        completed,
        durationExpected,
        durationActual
      ];
}
