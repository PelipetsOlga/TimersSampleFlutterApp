import 'package:either_dart/either.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'dart:async';

import '../../domain/models/project.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/repositories/timers_repo.dart';
import '../api/timers_api.dart';
import '../../domain/models/errors.dart';

class TimersRepositoryImpl implements TimersRepository {

  TimersApi api;
  AuthRepository authRepository;

  TimersRepositoryImpl(this.api, this.authRepository);

  @override
  Future<Either<Error, List<Project>>> getAllProjects(
      bool onlyFavourites) async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<Error, void>> likeProject(bool value) async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<Error, List<TimeSheet>>> getAllTimeSheets(int userId) async{
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<Error, Project>> createTimeSheet(TimeSheet input) async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<Error, void>> removeTimeSheet(TimeSheet input) async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<Error, void>> likeTimesheet(bool value) async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<Error, void>> startTimesheet() async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<Error, void>> pauseTimesheet() async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<Error, void>> stopTimesheet() async {
    return const Left(UnimplementedError());
  }
}
