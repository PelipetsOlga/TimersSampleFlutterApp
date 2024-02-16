import 'package:either_dart/either.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'dart:async';

import '../models/project.dart';
import '../../domain/models/errors.dart';

abstract interface class TimersRepository {

  Future<Either<AppError, List<ProjectModel>>> getAllProjects(bool onlyFavourites);
  Future<Either<AppError, void>> likeProject(bool value);

  Future<Either<AppError, List<TimeSheetModel>>> getAllTimeSheets(int userId);
  Future<Either<AppError, ProjectModel>> createTimeSheet(TimeSheetModel input);
  Future<Either<AppError, void>> removeTimeSheet(TimeSheetModel input);
  Future<Either<AppError, void>> likeTimesheet(bool value);
  Future<Either<AppError, void>> startTimesheet();
  Future<Either<AppError, void>> pauseTimesheet();
  Future<Either<AppError, void>> stopTimesheet();

}