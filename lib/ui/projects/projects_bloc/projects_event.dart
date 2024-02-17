part of 'bloc.dart';

sealed class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object> get props => [];
}

final class ProjectsRefresh extends ProjectsEvent {}

final class ProjectLike extends ProjectsEvent {
  String projectId;
  bool like;

  ProjectLike({
    required this.projectId,
    required this.like,
  });

  @override
  List<Object> get props => [projectId, like];
}
