import 'package:flutter_test_sample/data/models/time_sheet_request.dart';

import '../models/project.dart';

abstract class TimersApi {
  // This is Stub class instead of REST API
  // In real app we should use Retrofit here

  // HTTP GET
  Future<List<Project>> getAllProjects();

  // HTTP PATCH
  Future<void> likeProject({
    required int projectId,
    required int userId,
    required bool value,
  });

  // HTTP GET
  Future<List<Project>> getAllTimeSheets(int userId);

  // HTTP POST
  Future<Project> createTimeSheet(TimeSheetRequest input);

  // HTTP DELETE
  Future<void> removeTimeSheet(int timesheetId);

  Future<void> likeTimesheet({
    required int timesheetId,
    required int userId,
    required bool value,
  });

  Future<void> startTimesheet(int timesheetId);

  Future<void> stopTimesheet(int timesheetId);

  Future<void> pauseTimesheet(int timesheetId);
}

class TimersApiStub extends TimersApi {
  @override
  Future<List<Project>> getAllProjects() {
    // TODO: implement getAllProjects
    throw UnimplementedError();
  }

  @override
  Future<void> likeProject(
      {required int projectId, required int userId, required bool value}) {
    // TODO: implement likeProject
    throw UnimplementedError();
  }

  @override
  Future<Project> createTimeSheet(TimeSheetRequest input) {
    // TODO: implement createTimeSheet
    throw UnimplementedError();
  }

  @override
  Future<void> likeTimesheet(
      {required int timesheetId, required int userId, required bool value}) {
    // TODO: implement likeTimesheet
    throw UnimplementedError();
  }

  @override
  Future<void> removeTimeSheet(int timesheetId) {
    // TODO: implement removeTimeSheet
    throw UnimplementedError();
  }

  @override
  Future<void> pauseTimesheet(int timesheetId) {
    // TODO: implement pauseTimesheet
    throw UnimplementedError();
  }

  @override
  Future<void> startTimesheet(int timesheetId) {
    // TODO: implement startTimesheet
    throw UnimplementedError();
  }

  @override
  Future<void> stopTimesheet(int timesheetId) {
    // TODO: implement stopTimesheet
    throw UnimplementedError();
  }

  @override
  Future<List<Project>> getAllTimeSheets(int userId) {
    // TODO: implement getAllTimeSheets
    throw UnimplementedError();
  }
}