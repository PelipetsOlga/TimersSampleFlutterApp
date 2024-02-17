import 'package:equatable/equatable.dart';
import 'dart:core';

class TaskModel extends Equatable {
  const TaskModel(
    this.id,
    this.title,
    this.deadline,
  );

  final String id;
  final String title;
  final String deadline;

  @override
  List<Object> get props => [id, title, deadline];
}
