import 'package:equatable/equatable.dart';
import 'dart:core';

import 'task.dart';
import 'user.dart';

class ProjectModel extends Equatable {
  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    this.favourite = false,
    required this.user,
    required this.tasks,
  });

  final String id;
  final String title;
  final String description;
  bool favourite;
  final UserModel user;
  final List<TaskModel> tasks;

  @override
  List<Object> get props => [id, title, description, favourite, user, tasks];
}
