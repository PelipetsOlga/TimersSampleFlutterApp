part of 'timers_repo.dart';

ProjectModel _toProjectDomain(Project project) {
  return ProjectModel(
    id: project.id,
    title: project.title,
    number: project.number,
    description: project.description,
    userId: project.userId,
    tasks: project.tasks.map((e) => _toTaskDomain(e)).toList(),
    favourite: project.favourite,
    startDate: project.startDate,
    deadline: project.deadline,
  );
}

TaskModel _toTaskDomain(Task task) {
  return TaskModel(
    task.id,
    task.title,
    task.deadline,
  );
}

TimeSheetModel _toTimesheetDomain(TimeSheet timesheet) {
  return TimeSheetModel(
    id: timesheet.id,
    userId: timesheet.userId,
    description: timesheet.description,
    project: _toProjectDomain(timesheet.project),
    favourite: timesheet.favourite,
    inProgress: timesheet.inProgress,
    task: _toTaskDomain(timesheet.task),
    completed: timesheet.completed,
    durationExpected: timesheet.durationExpected,
    durationActual: timesheet.durationActual,
  );
}
