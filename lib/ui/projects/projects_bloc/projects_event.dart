part of 'bloc.dart';

sealed class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object> get props => [];
}

final class ProjectsRefresh extends ProjectsEvent {
  bool favourite;

  ProjectsRefresh({required this.favourite});

  @override
  List<Object> get props => [favourite];
}

final class ProjectLike extends ProjectsEvent {
  ProjectModel project;
  bool like;

  ProjectLike({
    required this.project,
    required this.like,
  });

  @override
  List<Object> get props => [project, like];
}
