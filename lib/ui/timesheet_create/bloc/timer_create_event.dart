part of 'bloc.dart';

sealed class TimerCreateEvent extends Equatable {
  const TimerCreateEvent();

  @override
  List<Object> get props => [];
}

final class TimerCreateFetch extends TimerCreateEvent {}

final class TimerCreateDo extends TimerCreateEvent {
  String description;
  bool like;
  ProjectModel project;
  TaskModel task;

  TimerCreateDo({
    required this.description,
    required this.like,
    required this.project,
    required this.task,
  });

  @override
  List<Object> get props => [description, like,project, task];
}
