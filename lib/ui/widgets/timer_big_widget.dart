import 'package:flutter/material.dart';
import 'package:flutter_test_sample/ui/widgets/timer_main_screen.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../domain/models/timer_conter.dart';

class TimerBigView extends StatelessWidget {
  final CountdownController controller;
  final int timerInitialTime;
  final TimerModel timer;
  final VoidCallback updateTimerOnTick;
  final VoidCallback completeTimer;
  final VoidCallback pauseTimer;
  final VoidCallback startTimer;

  const TimerBigView({
    super.key,
    required this.controller,
    required this.timerInitialTime,
    required this.timer,
    required this.updateTimerOnTick,
    required this.completeTimer,
    required this.pauseTimer,
    required this.startTimer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Countdown(
          controller: controller,
          seconds: timerInitialTime,
          build: (_, double time) {
            updateTimerOnTick();
            return Text(
              formattedTime(timeInSecond: time.toInt(), showSeconds: true),
              style: Theme.of(context).textTheme.displaySmall,
            );
          },
          interval: const Duration(milliseconds: 1000),
          onFinished: completeTimer,
        ),
        const Expanded(child: SizedBox(width: 8)),
        _stopButton(context),
        const SizedBox(width: 16),
        _playPauseButton(context),
      ],
    );
  }

  Widget _stopButton(BuildContext context) {
    return IconButton(
        icon: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              shape: BoxShape.circle),
          child: const Icon(Icons.stop),
        ),
        iconSize: 36,
        onPressed: completeTimer);
  }

  Widget _playPauseButton(BuildContext context) {
    return timer.state == TimerState.inProgress
        ? _playPauseButtonDecoration(context, Icons.pause, pauseTimer)
        : timer.state == TimerState.completed
            ? const SizedBox(width: 0)
            : _playPauseButtonDecoration(context, Icons.play_arrow, startTimer);
  }

  Widget _playPauseButtonDecoration(
      BuildContext context, IconData iconData, VoidCallback onPressed) {
    return IconButton(
        icon: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              shape: BoxShape.circle),
          child: Icon(
            iconData,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
        iconSize: 36,
        onPressed: onPressed);
  }
}
