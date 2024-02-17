import 'package:json_annotation/json_annotation.dart';

import 'task.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  Project({
    required this.id,
    required this.title,
    required this.number,
    required this.description,
    required this.favourite,
    required this.userId,
    required this.tasks,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  final String id;
  final String title;
  final String number;
  final String description;
  final bool favourite;
  final String userId;
  final List<Task> tasks;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
