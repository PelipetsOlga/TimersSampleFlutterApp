// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSheet _$TimeSheetFromJson(Map<String, dynamic> json) => TimeSheet(
      id: json['id'] as String,
      userId: json['userId'] as String,
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      favourite: json['favourite'] as bool,
      timeRecord:
          TimeRecord.fromJson(json['timeRecord'] as Map<String, dynamic>),
      inProgress: json['inProgress'] as bool,
    );

Map<String, dynamic> _$TimeSheetToJson(TimeSheet instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'project': instance.project,
      'favourite': instance.favourite,
      'timeRecord': instance.timeRecord,
      'inProgress': instance.inProgress,
    };
