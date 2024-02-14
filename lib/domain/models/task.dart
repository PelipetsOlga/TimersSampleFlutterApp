import 'package:equatable/equatable.dart';
import 'dart:core';

class Task extends Equatable {
  const Task(
    this.id,
    this.title,
    this.deadline,
  );

  final int id;
  final String title;
  final String deadline;

  @override
  List<Object> get props => [id, title, deadline];
}
