import 'package:equatable/equatable.dart';
import 'dart:core';

import 'task.dart';
import 'user.dart';

class ProjectModel extends Equatable {
  ProjectModel({
    required this.id,
    required this.title,
    required this.number,
    required this.description,
    this.favourite = false,
    required this.userId,
    required this.tasks,
    required this.startDate,
    required this.deadline,
  });

  final String id;
  final String title;
  final String number;
  final String description;
  bool favourite;
  final String userId;
  final List<TaskModel> tasks;
  final int startDate;
  final int deadline;

  @override
  List<Object> get props => [
        id,
        title,
        number,
        startDate,
        deadline,
        description,
        favourite,
        userId,
        tasks
      ];
}
