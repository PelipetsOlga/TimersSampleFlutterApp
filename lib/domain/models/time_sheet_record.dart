import 'package:equatable/equatable.dart';

class TimeRecordModel extends Equatable {
  TimeRecordModel(
    this.id,
    this.startDate,
    this.completed,
    this.durationExpected,
    this.durationActual,
  );

  final int id;
  final int startDate;
  bool completed;
  final int durationExpected;
  int durationActual;

  @override
  List<Object> get props =>
      [id, startDate, completed, durationExpected, durationActual];
}
