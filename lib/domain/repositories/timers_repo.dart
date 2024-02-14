import 'package:either_dart/either.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'dart:async';

import '../models/project.dart';

abstract interface class TimersRepository {

  Future<Either<Error, List<Project>>> getAllProjects(bool onlyFavourites);
  Future<Either<Error, void>> likeProject(bool value);

  Future<Either<Error, Project>> createTimeSheet(TimeSheet input);
  Future<Either<Error, void>> removeTimeSheet(TimeSheet input);
  Future<Either<Error, void>> likeTimesheet(bool value);
  Future<Either<Error, void>> startTimesheet();
  Future<Either<Error, void>> pauseTimesheet();
  Future<Either<Error, void>> stopTimesheet();

}