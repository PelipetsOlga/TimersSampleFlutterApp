// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSheet _$TimeSheetFromJson(Map<String, dynamic> json) => TimeSheet(
      id: json['id'] as String,
      userId: json['userId'] as String,
      description: json['description'] as String,
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      task: Task.fromJson(json['task'] as Map<String, dynamic>),
      favourite: json['favourite'] as bool,
      inProgress: json['inProgress'] as bool,
      completed: json['completed'] as bool,
      durationExpected: json['durationExpected'] as int,
      durationActual: json['durationActual'] as int,
    );

Map<String, dynamic> _$TimeSheetToJson(TimeSheet instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'description': instance.description,
      'project': instance.project,
      'task': instance.task,
      'favourite': instance.favourite,
      'inProgress': instance.inProgress,
      'completed': instance.completed,
      'durationExpected': instance.durationExpected,
      'durationActual': instance.durationActual,
    };
