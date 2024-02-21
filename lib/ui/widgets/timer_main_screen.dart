import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'package:flutter_test_sample/ui/widgets/timer_big_widget.dart';
import 'package:flutter_test_sample/ui/widgets/timer_small_widget.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../di/di.dart';
import '../../domain/models/timer_conter.dart';
import '../timesheets_details/timesheets_details_bloc/bloc.dart';

class TimerWidget extends StatefulWidget {
  final TimeSheetModel timesheet;
  final bool showSeconds;
  final bool detailed;

  const TimerWidget(
      {required this.timesheet,
      required this.showSeconds,
      required this.detailed,
      super.key});

  @override
  State<StatefulWidget> createState() {
    return _TimerWidgetState();
  }
}

class _TimerWidgetState extends State<TimerWidget> {
  final CountdownController _controller = CountdownController(autoStart: false);

  void _startTimer() {
    if (widget.timesheet.timer.state == TimerState.inProgress ||
        widget.timesheet.timer.state == TimerState.completed) {
      return;
    }
    widget.timesheet.timer.state = TimerState.inProgress;
    _controller.start();
    widget.timesheet.timer.lastTickerStartTime =
        DateTime.now().millisecondsSinceEpoch;
  }

  void _pauseTimer() {
    if (widget.timesheet.timer.state != TimerState.inProgress) {
      return;
    }
    widget.timesheet.timer.state = TimerState.inPause;
    _controller.pause();
    widget.timesheet.timer.lastTickerStartTime = 0;
  }

  void _completeTimer() {
    if (widget.timesheet.timer.state == TimerState.completed) {
      return;
    }
    widget.timesheet.timer.state = TimerState.completed;
    widget.timesheet.timer.completed = true;
    _controller.pause();
    widget.timesheet.timer.lastTickerStartTime = 0;
    try {
      context.read<TimesheetsDetailsBloc>().add(TimesheetsRefresh());
    } catch (e) {
      logger.e(e);
    }
  }

  void _updateTimerOnTick() {
    if (widget.timesheet.timer.state != TimerState.inProgress) {
      return;
    }
    var durationActual = widget.timesheet.timer.durationActual;
    var timeNow = DateTime.now().millisecondsSinceEpoch;
    var difFromLastTick = timeNow - widget.timesheet.timer.lastTickerStartTime;

    widget.timesheet.timer.durationActual = (durationActual + difFromLastTick);
    if (widget.timesheet.timer.durationActual >=
        widget.timesheet.timer.durationExpected) {
      _completeTimer();
    } else {
      widget.timesheet.timer.lastTickerStartTime = timeNow;
    }
  }

  void _startTimerWithDelay() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted && widget.timesheet.timer.state == TimerState.inProgress) {
      setState(() {
        _startTimer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int timerInitialTime = 0;

    if (widget.timesheet.timer.state == TimerState.inProgress) {
      var nowTime = DateTime.now().millisecondsSinceEpoch;
      var difFromLastStart =
          nowTime - widget.timesheet.timer.lastTickerStartTime;
      var durationCurrent =
          difFromLastStart + widget.timesheet.timer.durationActual;
      if ((durationCurrent) > widget.timesheet.timer.durationExpected) {
        _completeTimer();
        timerInitialTime = 0;
      } else {
        timerInitialTime =
            (widget.timesheet.timer.durationExpected - durationCurrent) ~/ 1000;
        _startTimerWithDelay();
      }
    } else if (widget.timesheet.timer.state == TimerState.inPause) {
      timerInitialTime = (widget.timesheet.timer.durationExpected -
              widget.timesheet.timer.durationActual) ~/
          1000;
    } else if (widget.timesheet.timer.state == TimerState.completed) {
      timerInitialTime = 0;
    } else {
      // if state == TimerState.initial
      timerInitialTime = widget.timesheet.timer.durationExpected ~/ 1000;
    }
    return widget.detailed
        ? TimerBigView(
            controller: _controller,
            timerInitialTime: timerInitialTime,
            timer: widget.timesheet.timer,
            updateTimerOnTick: _updateTimerOnTick,
            completeTimer: _completeTimer,
            pauseTimer: () {
              setState(() {
                _pauseTimer();
              });
            },
            startTimer: () {
              setState(() {
                _startTimer();
              });
            },
          )
        : TimerSmallView(
            controller: _controller,
            timerInitialTime: timerInitialTime,
            timer: widget.timesheet.timer,
            updateTimerOnTick: _updateTimerOnTick,
            completeTimer: _completeTimer,
            pauseTimer: () {
              setState(() {
                _pauseTimer();
              });
            },
            startTimer: () {
              setState(() {
                _startTimer();
              });
            },
          );
  }
}

String formattedTime({required int timeInSecond, required bool showSeconds}) {
  int sec = timeInSecond % 60;
  int minRaw = (timeInSecond / 60).floor();
  int h = (timeInSecond / (60 * 60)).floor();
  int min = minRaw - (h * 60);
  String hours = h.toString().length <= 1 ? "0$h" : "$h";
  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
  return showSeconds ? "$hours:$minute:$second" : "$hours:$minute";
}

String logTimer(TimerModel model) {
  var seconds = (model.durationExpected - model.durationActual) ~/ 1000;
  return "left time = ${formattedTime(timeInSecond: seconds, showSeconds: true)}";
}
