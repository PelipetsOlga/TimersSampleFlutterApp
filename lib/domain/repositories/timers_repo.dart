import 'package:either_dart/either.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'dart:async';

import '../models/project.dart';
import '../../domain/models/errors.dart';

abstract interface class TimersRepository {

  Future<Either<Error, List<ProjectModel>>> getAllProjects(bool onlyFavourites);
  Future<Either<Error, void>> likeProject(bool value);

  Future<Either<Error, List<TimeSheetModel>>> getAllTimeSheets(int userId);
  Future<Either<Error, ProjectModel>> createTimeSheet(TimeSheetModel input);
  Future<Either<Error, void>> removeTimeSheet(TimeSheetModel input);
  Future<Either<Error, void>> likeTimesheet(bool value);
  Future<Either<Error, void>> startTimesheet();
  Future<Either<Error, void>> pauseTimesheet();
  Future<Either<Error, void>> stopTimesheet();

}