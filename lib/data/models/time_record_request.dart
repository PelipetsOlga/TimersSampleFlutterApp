import 'package:json_annotation/json_annotation.dart';

part 'time_record_request.g.dart';

@JsonSerializable()
class TimeRecordRequest {
  TimeRecordRequest({
    required this.id,
    required this.startDate,
    required this.completed,
    required this.durationExpected,
    required this.durationActual,
  });

  factory TimeRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$TimeRecordRequestFromJson(json);

  final int? id;
  final int startDate;
  final bool completed;
  final int durationExpected;
  final int durationActual;

  Map<String, dynamic> toJson() => _$TimeRecordRequestToJson(this);
}
