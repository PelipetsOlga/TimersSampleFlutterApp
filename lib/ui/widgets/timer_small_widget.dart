import 'package:flutter/material.dart';
import 'package:flutter_test_sample/ui/widgets/timer_main_screen.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../domain/models/timer_conter.dart';

class TimerSmallView extends StatelessWidget {
  final CountdownController controller;
  final int timerInitialTime;
  final TimerModel timer;
  final VoidCallback updateTimerOnTick;
  final VoidCallback completeTimer;
  final VoidCallback pauseTimer;
  final VoidCallback startTimer;

  const TimerSmallView({
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
            controller: controller,
            seconds: timerInitialTime,
            build: (_, double time) {
              updateTimerOnTick();
              return Text(
                formattedTime(timeInSecond: time.toInt(), showSeconds: false),
                style: Theme.of(context).textTheme.labelLarge,
              );
            },
            interval: const Duration(milliseconds: 1000),
            onFinished: completeTimer,
          ),
          const SizedBox(width: 0),
          timer.state == TimerState.inProgress
              ? IconButton(
            icon: const Icon(Icons.pause),
            onPressed: pauseTimer,
          )
              : timer.state == TimerState.completed
              ? const SizedBox(width: 0)
              : IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: startTimer,
          )
        ],
      ),
    );
  }
}