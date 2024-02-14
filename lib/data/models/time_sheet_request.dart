import 'package:flutter_test_sample/data/models/time_record_request.dart';
import 'package:json_annotation/json_annotation.dart';

import 'project.dart';
import 'time_record.dart';
import 'user.dart';

part 'time_sheet_request.g.dart';

@JsonSerializable()
class TimeSheetRequest {
  TimeSheetRequest({
    required this.userId,
    required this.projectId,
    required this.favourite,
    required this.timeRecordrequest,
    required this.inProgress,
  });

  factory TimeSheetRequest.fromJson(Map<String, dynamic> json) =>
      _$TimeSheetRequestFromJson(json);

  final int userId;
  final int projectId;
  final bool favourite;
  final TimeRecordRequest timeRecordrequest;
  final bool inProgress;

  Map<String, dynamic> toJson() => _$TimeSheetRequestToJson(this);
}
