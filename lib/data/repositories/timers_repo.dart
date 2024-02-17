import 'package:either_dart/either.dart';
import 'package:flutter_test_sample/data/models/time_sheet.dart';
import 'package:flutter_test_sample/domain/models/task.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'dart:async';

import '../../domain/models/project.dart';
import '../../domain/models/time_sheet_record.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/repositories/timers_repo.dart';
import '../api/timers_api.dart';
import '../../domain/models/errors.dart';
import '../models/project.dart';
import '../models/task.dart';
import '../models/time_record.dart';

part 'timers_mapper.dart';

class TimersRepositoryImpl implements TimersRepository {
  TimersApi api;
  AuthRepository authRepository;

  TimersRepositoryImpl(this.api, this.authRepository);

  List<ProjectModel>? projectsCache;
  List<TimeSheetModel>? timesheetsCache;

  @override
  Future<Either<AppError, List<ProjectModel>>> getAllProjects(
      bool onlyFavourites) async {
    if (projectsCache != null) {
      return Right(projectsCache!);
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
  Future<void> likeProject(bool value, String projectId) async {
    projectsCache?.firstWhere((element) => element.id == projectId).favourite =
        value;
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
  Future<Either<AppError, ProjectModel>> createTimeSheet(
      TimeSheetModel input) async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<AppError, void>> removeTimeSheet(TimeSheetModel input) async {
    return const Left(UnimplementedError());
  }

  @override
  Future< void> likeTimesheet(bool value, String timesheetId) async {
    timesheetsCache?.firstWhere((element) => element.id == timesheetId).favourite =
        value;
  }

  @override
  Future<Either<AppError, void>> startTimesheet() async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<AppError, void>> pauseTimesheet() async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<AppError, void>> stopTimesheet() async {
    return const Left(UnimplementedError());
  }
}
