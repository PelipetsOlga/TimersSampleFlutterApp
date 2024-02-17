part of 'timers_repo.dart';

ProjectModel _toProjectDomain(Project project) {
  return ProjectModel(
    id: project.id,
    title: project.title,
    number: project.number,
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

TimeSheetModel _toTimesheetDomain(TimeSheet timesheet) {
  return TimeSheetModel(
    id: timesheet.id,
    userId: timesheet.userId,
    project: timesheet.project,
    favourite: timesheet.favourite,
    inProgress: timesheet.inProgress,
    timeRecord: _toTimeRecordDomain(timesheet.timeRecord),
  );
}

TimeRecordModel _toTimeRecordDomain(TimeRecord record) {
  return TimeRecordModel(
    id: record.id,
    startDate: record.startDate,
    deadline: record.deadline,
    completed: record.completed,
    durationExpected: record.durationExpected,
    durationActual: record.durationActual,
  );
}
