part of 'timers_repo.dart';

ProjectModel _toProjectDomain(Project project) {
  return ProjectModel(
    id: project.id,
    title: project.title,
    description: project.description,
    user: userEmpty,
    tasks: project.tasks.map((e) => _toTaskDomain(e)).toList(),
  );
}

TaskModel _toTaskDomain(Task task) {
  return TaskModel(
    task.id,
    task.title,
    task.deadline,
  );
}
