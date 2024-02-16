part of 'timers_repo.dart';

ProjectModel _toDomain(Project project) {
  return ProjectModel(
    id: project.id,
    title: project.title,
    description: project.description,
    user: userEmpty,
    tasks: []
  );
}