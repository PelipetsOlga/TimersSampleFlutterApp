part of 'bloc.dart';

sealed class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object> get props => [];
}

final class ProjectsRefresh extends ProjectsEvent {
  bool favorites;

  ProjectsRefresh({required this.favorites});

  @override
  List<Object> get props => [favorites];
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
