// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeRecord _$TimeRecordFromJson(Map<String, dynamic> json) => TimeRecord(
      id: json['id'] as int,
      startDate: json['startDate'] as int,
      completed: json['completed'] as bool,
      durationExpected: json['durationExpected'] as int,
      durationActual: json['durationActual'] as int,
    );

Map<String, dynamic> _$TimeRecordToJson(TimeRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'completed': instance.completed,
      'durationExpected': instance.durationExpected,
      'durationActual': instance.durationActual,
    };