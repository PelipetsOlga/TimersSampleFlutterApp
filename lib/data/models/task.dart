import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  const Task({
    required this.id,
    required this.title,
    required this.deadline,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  final String id;
  final String title;
  final String deadline;

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
