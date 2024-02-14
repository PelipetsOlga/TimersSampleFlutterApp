import 'package:json_annotation/json_annotation.dart';

part 'time_record.g.dart';

@JsonSerializable()
class TimeRecord {
  TimeRecord({
    required this.id,
    required this.startDate,
    required this.completed,
    required this.durationExpected,
    required this.durationActual,
  });

  factory TimeRecord.fromJson(Map<String, dynamic> json) =>
      _$TimeRecordFromJson(json);

  final int id;
  final int startDate;
  final bool completed;
  final int durationExpected;
  final int durationActual;

  Map<String, dynamic> toJson() => _$TimeRecordToJson(this);
}
