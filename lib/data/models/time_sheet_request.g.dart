// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_sheet_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSheetRequest _$TimeSheetRequestFromJson(Map<String, dynamic> json) =>
    TimeSheetRequest(
      userId: json['userId'] as int,
      projectId: json['projectId'] as int,
      favourite: json['favourite'] as bool,
      timeRecordrequest: TimeRecordRequest.fromJson(
          json['timeRecordrequest'] as Map<String, dynamic>),
      inProgress: json['inProgress'] as bool,
    );

Map<String, dynamic> _$TimeSheetRequestToJson(TimeSheetRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'projectId': instance.projectId,
      'favourite': instance.favourite,
      'timeRecordrequest': instance.timeRecordrequest,
      'inProgress': instance.inProgress,
    };
