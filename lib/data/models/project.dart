import 'package:json_annotation/json_annotation.dart';

import 'task.dart';
import 'user.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  Project(this.id, this.title, this.description, this.favourite, this.user,
      this.tasks);

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  final int id;
  final String title;
  final String description;
  final bool favourite;
  final User user;
  final List<Task> tasks;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
