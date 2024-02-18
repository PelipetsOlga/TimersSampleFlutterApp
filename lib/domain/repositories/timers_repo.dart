import 'package:either_dart/either.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'dart:async';

import '../models/project.dart';
import '../../domain/models/errors.dart';

abstract interface class TimersRepository {

  Future<Either<AppError, List<ProjectModel>>> getAllProjects(bool onlyFavourites);
  Future<void> likeProject(bool value, ProjectModel project);

  Future<Either<AppError, List<TimeSheetModel>>> getAllTimeSheets();
  Future<void> createTimer(TimeSheetModel input);
  Future<Either<AppError, void>> removeTimeSheet(TimeSheetModel input);
  Future<void> likeTimesheet(bool value, String timesheetId);
  Future<Either<AppError, void>> startTimesheet();
  Future<Either<AppError, void>> pauseTimesheet();
  Future<Either<AppError, void>> stopTimesheet();

}