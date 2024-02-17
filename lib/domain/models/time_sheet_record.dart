import 'package:equatable/equatable.dart';

class TimeRecordModel extends Equatable {
  TimeRecordModel({
    required this.id,
    required this.startDate,
    required this.deadline,
    required this.completed,
    required this.durationExpected,
    required this.durationActual,
  });

  final String id;
  final int startDate;
  final int deadline;
  bool completed;
  final int durationExpected;
  int durationActual;

  @override
  List<Object> get props =>
      [id, startDate, deadline, completed, durationExpected, durationActual];
}
