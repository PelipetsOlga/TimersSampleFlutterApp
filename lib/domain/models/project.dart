import 'package:equatable/equatable.dart';
import 'dart:core';

import 'task.dart';
import 'user.dart';

class ProjectModel extends Equatable {
  ProjectModel(this.id, this.title, this.description, this.favourite, this.user,
      this.tasks);

  final int id;
  final String title;
  final String description;
  bool favourite;
  final UserModel user;
  final List<TaskModel> tasks;

  @override
  List<Object> get props => [id, title, description, favourite, user, tasks];
}
