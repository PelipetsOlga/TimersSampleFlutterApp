part of 'bloc.dart';

sealed class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object> get props => [];
}

final class ProjectsInitial extends ProjectsState {}

final class ProjectsLoading extends ProjectsState {}

final class ProjectsEmptyLoaded extends ProjectsState {}

final class ProjectsLoaded extends ProjectsState {
  const ProjectsLoaded(this.projects);

  final List<ProjectModel> projects;

  @override
  List<Object> get props => [projects, projects.length];
}

final class ProjectsError extends ProjectsState {
  const ProjectsError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
