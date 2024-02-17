// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as String,
      title: json['title'] as String,
      number: json['number'] as String,
      description: json['description'] as String,
      favourite: json['favourite'] as bool,
      userId: json['userId'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'number': instance.number,
      'description': instance.description,
      'favourite': instance.favourite,
      'userId': instance.userId,
      'tasks': instance.tasks,
    };
