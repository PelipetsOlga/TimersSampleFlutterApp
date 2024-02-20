import 'package:flutter/material.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../di/di.dart';
import '../../domain/models/timer_conter.dart';

class TimerMainWidget extends StatefulWidget {
  final TimeSheetModel model;
  final bool showSeconds;

  const TimerMainWidget(
      {required this.model, required this.showSeconds, super.key});

  @override
  State<StatefulWidget> createState() {
    return _TimerMainWidgetState();
  }
}

class _TimerMainWidgetState extends State<TimerMainWidget> {
  final CountdownController _controller = CountdownController(autoStart: false);

  void _startTimer() {
    if (widget.model.timer.state == TimerState.inProgress ||
        widget.model.timer.state == TimerState.completed) {
      logger.d("_startTimer state = ${widget.model.timer.state}, NOT STARTED");
      return;
    }
    widget.model.timer.state = TimerState.inProgress;
    _controller.start();
    widget.model.timer.lastTickerStartTime =
        DateTime.now().millisecondsSinceEpoch;

    logger.d(
        "_startTimer lastTickerStartTime=${widget.model.timer.lastTickerStartTime}");
  }

  void _pauseTimer() {
    if (widget.model.timer.state != TimerState.inProgress) {
      logger.d("_pauseTimer state = ${widget.model.timer.state}, NOT Paused");
      return;
    }
    widget.model.timer.state = TimerState.inPause;
    _controller.pause();
    widget.model.timer.lastTickerStartTime = 0;
    logger.d("_pauseTimer");
  }

  void _completeTimer() {
    if (widget.model.timer.state == TimerState.completed) {
      logger.d(
          "_completeTimer state = ${widget.model.timer.state}, NOT COMPLETED");
      return;
    }
    widget.model.timer.state = TimerState.completed;
    widget.model.timer.completed = true;
    _controller.pause();
    widget.model.timer.lastTickerStartTime = 0;
    logger.d("_completeTimer");
  }

  void _updateTimerOnTick() {
    if (widget.model.timer.state != TimerState.inProgress) {
      logger.d(
          "_updateTimerOnTick state = ${widget.model.timer.state}, NOT UPDATED");
      return;
    }
    var durationActual = widget.model.timer.durationActual;
    var timeNow = DateTime.now().millisecondsSinceEpoch;
    var difFromLastTick = timeNow - widget.model.timer.lastTickerStartTime;

    widget.model.timer.durationActual = (durationActual + difFromLastTick);
    if (widget.model.timer.durationActual >=
        widget.model.timer.durationExpected) {
      _completeTimer();
    } else {
      widget.model.timer.lastTickerStartTime = timeNow;
    }
    logger.d("_updateTimer tickedTime = $difFromLastTick");
  }

  void _startTimerWithDelay() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted && widget.model.timer.state == TimerState.inProgress) {
      setState(() {
        _startTimer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int timerInitialTime = 0;

    if (widget.model.timer.state == TimerState.inProgress) {
      var nowTime = DateTime.now().millisecondsSinceEpoch;
      var difFromLastStart = nowTime - widget.model.timer.lastTickerStartTime;
      var durationCurrent =
          difFromLastStart + widget.model.timer.durationActual;
      logger.d(
          "build widget state == TimerState.inProgress durationCurrent=$durationCurrent");
      if ((durationCurrent) > widget.model.timer.durationExpected) {
        _completeTimer();
        timerInitialTime = 0;
      } else {
        timerInitialTime =
            (widget.model.timer.durationExpected - durationCurrent) ~/ 1000;
        logger.d(
            "build widget state == TimerState.inProgress durationCurrent=$durationCurrent");
        _startTimerWithDelay();
      }
    } else if (widget.model.timer.state == TimerState.inPause) {
      timerInitialTime = (widget.model.timer.durationExpected -
              widget.model.timer.durationActual) ~/
          1000;
    } else if (widget.model.timer.state == TimerState.completed) {
      timerInitialTime = 0;
    } else {
      //TimerState.initial
      timerInitialTime = widget.model.timer.durationExpected ~/ 1000;
    }

    return Container(
      width: 104,
      height: 48,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        border: Border.all(color: Colors.black, width: 0.0),
        borderRadius: const BorderRadius.all(Radius.circular(64)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Countdown(
            controller: _controller,
            seconds: timerInitialTime,
            build: (_, double time) {
              _updateTimerOnTick();
              return Text(
                formattedTime(
                    timeInSecond: time.toInt(),
                    showSeconds: widget.showSeconds),
                style: Theme.of(context).textTheme.labelLarge,
              );
            },
            interval: const Duration(milliseconds: 1000),
            onFinished: () {
              _completeTimer();
            },
          ),
          const SizedBox(width: 0),
          widget.model.timer.state == TimerState.inProgress
              ? IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    setState(() {
                      _pauseTimer();
                    });
                  })
              : widget.model.timer.state == TimerState.completed
                  ? const SizedBox(width: 0)
                  : IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          _startTimer();
                        });
                      },
                    )
        ],
      ),
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
