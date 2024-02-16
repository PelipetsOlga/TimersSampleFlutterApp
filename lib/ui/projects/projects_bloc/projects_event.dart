part of 'bloc.dart';

sealed class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object> get props => [];
}

final class ProjectsRefresh extends ProjectsEvent {}
