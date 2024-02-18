part of 'bloc.dart';

sealed class TimerCreateState extends Equatable {
  const TimerCreateState();

  @override
  List<Object> get props => [];
}

final class TimerCreateInitial extends TimerCreateState {}

final class TimerCreateLoading extends TimerCreateState {}

final class TimerCreateLoaded extends TimerCreateState {
  const TimerCreateLoaded(this.projects);

  final List<ProjectModel> projects;

  @override
  List<Object> get props => [projects];
}

final class TimerCreateCreated extends TimerCreateState {}
