import 'package:either_dart/either.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'dart:async';
import 'package:pair/pair.dart';

import '../models/project.dart';
import '../../domain/models/errors.dart';

abstract interface class TimersRepository {
  Future<Either<AppError, List<ProjectModel>>> getAllProjects(
      bool onlyFavourites);

  Future<void> likeProject(bool value, ProjectModel project);

  Future<Either<AppError, List<TimeSheetModel>>> getAllTimeSheets();
  Future<Either<AppError, Pair<List<TimeSheetModel>,List<TimeSheetModel>>>> getTimeSheets();

  Future<void> createTimer(TimeSheetModel input);

  Future<Either<AppError, void>> removeTimeSheet(TimeSheetModel input);

  Future<void> likeTimesheet(bool value, String timesheetId);
}
