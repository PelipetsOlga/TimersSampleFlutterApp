import 'package:equatable/equatable.dart';

enum TimerState { initial, inProgress, inPause, completed }

class TimerModel extends Equatable {
  TimerModel({
    required this.durationExpected,
    required this.durationActual,
    required this.completed,
    required this.state,
    required this.lastTickerStartTime,
  });

  final int durationExpected;
  int durationActual;
  bool completed;
  TimerState state;
  int lastTickerStartTime;

  @override
  List<Object> get props =>
      [durationExpected, durationActual, completed, state, lastTickerStartTime];

  TimerModel.createNew(this.durationExpected)
      : durationActual = 0,
        completed = false,
        state = TimerState.initial,
        lastTickerStartTime = 0;

  TimerModel.createStub()
      : durationExpected = 8 * 60 * 60 * 1000,
        durationActual = 0,
        completed = false,
        state = TimerState.initial,
        lastTickerStartTime = 0;
}

TimerModel timerEmpty = TimerModel(
  durationExpected: 0,
  durationActual: 0,
  completed: false,
  state: TimerState.initial,
  lastTickerStartTime: 0,
);
