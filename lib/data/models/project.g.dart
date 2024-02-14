// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      json['id'] as int,
      json['title'] as String,
      json['description'] as String,
      json['favourite'] as bool,
      User.fromJson(json['user'] as Map<String, dynamic>),
      (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'favourite': instance.favourite,
      'user': instance.user,
      'tasks': instance.tasks,
    };
