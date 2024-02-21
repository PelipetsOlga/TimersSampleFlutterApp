import 'package:either_dart/either.dart';
import 'package:flutter_test_sample/data/models/time_sheet.dart';
import 'package:flutter_test_sample/domain/models/task.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'package:pair/pair.dart';
import 'dart:async';

import '../../domain/models/project.dart';
import '../../domain/models/timer_conter.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/repositories/timers_repo.dart';
import '../api/timers_api.dart';
import '../../domain/models/errors.dart';
import '../models/project.dart';
import '../models/task.dart';

part 'timers_mapper.dart';

class TimersRepositoryImpl implements TimersRepository {
  TimersApi api;
  AuthRepository authRepository;

  TimersRepositoryImpl(this.api, this.authRepository);

  List<ProjectModel>? projectsCache;
  List<TimeSheetModel>? timesheetsCache;

  List<ProjectModel> filterProjects(
      bool favorite, List<ProjectModel> originalList) {
    if (!favorite) {
      return originalList;
    }
    return originalList.where((element) => element.favourite).toList();
  }

  @override
  Future<Either<AppError, List<ProjectModel>>> getAllProjects(
      bool onlyFavourites) async {
    if (projectsCache != null) {
      return Right(filterProjects(onlyFavourites, projectsCache!));
    }
    try {
      List<Project> projects = await api.getAllProjects();
      var result = projects.map((e) => _toProjectDomain(e)).toList();
      projectsCache = result;
      return Right(projectsCache!);
    } catch (e) {
      return const Left(NetworkError());
    }
  }

  @override
  Future<void> likeProject(bool value, ProjectModel project) async {
    projectsCache
        ?.firstWhere((element) => (element.id == project.id &&
            element.title == project.title &&
            element.number == project.number))
        .favourite = value;
  }

  @override
  Future<Either<AppError, List<TimeSheetModel>>> getAllTimeSheets() async {
    if (timesheetsCache != null) {
      return Right(timesheetsCache!);
    }
    try {
      List<TimeSheet> timesheets =
          await api.getAllTimeSheets(authRepository.profile().id);
      var result = timesheets.map((e) => _toTimesheetDomain(e)).toList();
      timesheetsCache = result;
      return Right(timesheetsCache!);
    } catch (e) {
      return const Left(NetworkError());
    }
  }

  @override
  Future<Either<AppError, Pair<List<TimeSheetModel>, List<TimeSheetModel>>>>
      getTimeSheets() async {
    if (timesheetsCache != null) {
      return Right(_createPair(timesheetsCache!));
    }
    try {
      List<TimeSheet> timesheets =
          await api.getAllTimeSheets(authRepository.profile().id);
      var result = timesheets.map((e) => _toTimesheetDomain(e)).toList();
      timesheetsCache = result;
      return Right(_createPair(timesheetsCache!));
    } catch (e) {
      return const Left(NetworkError());
    }
  }

  Pair<List<TimeSheetModel>, List<TimeSheetModel>> _createPair(
      List<TimeSheetModel> timesheets) {
    var completedTimesheets =
        timesheets.where((element) => element.timer.completed).toList();
    var notCompletedTimesheets =
        timesheets.where((element) => !element.timer.completed).toList();
    return Pair(completedTimesheets, notCompletedTimesheets);
  }

  @override
  Future<void> createTimer(TimeSheetModel input) async {
    return timesheetsCache?.add(input);
  }

  @override
  Future<Either<AppError, void>> removeTimeSheet(TimeSheetModel input) async {
    return const Left(UnimplementedError());
  }

  @override
  Future<void> likeTimesheet(bool value, String timesheetId) async {
    timesheetsCache
        ?.firstWhere((element) => element.id == timesheetId)
        .favourite = value;
  }
}
