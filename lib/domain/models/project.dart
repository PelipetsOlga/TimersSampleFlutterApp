import 'package:equatable/equatable.dart';
import 'dart:core';

import 'task.dart';
import 'user.dart';

class Project extends Equatable {
  Project(this.id, this.title, this.description, this.favourite, this.user,
      this.tasks);

  final int id;
  final String title;
  final String description;
  bool favourite;
  final User user;
  final List<Task> tasks;

  @override
  List<Object> get props => [id, title, description, favourite, user, tasks];
}
