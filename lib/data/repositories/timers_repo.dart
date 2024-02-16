import 'package:either_dart/either.dart';
import 'package:flutter_test_sample/domain/models/time_sheet.dart';
import 'dart:async';

import '../../domain/models/project.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/repositories/timers_repo.dart';
import '../api/timers_api.dart';
import '../../domain/models/errors.dart';
import '../models/project.dart';

part 'timers_mapper.dart';

class TimersRepositoryImpl implements TimersRepository {
  TimersApi api;
  AuthRepository authRepository;

  TimersRepositoryImpl(this.api, this.authRepository);

  @override
  Future<Either<AppError, List<ProjectModel>>> getAllProjects(
      bool onlyFavourites) async {
    try {
      List<Project> projects = await api.getAllProjects();
      return Right(projects.map((e) => _toDomain(e)).toList());
    } catch (e) {
      return const Left(AuthorisationError());
    }
  }

  @override
  Future<Either<AppError, void>> likeProject(bool value) async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<AppError, List<TimeSheetModel>>> getAllTimeSheets(
      int userId) async {
    return const Left(UnimplementedError());
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
  Future<Either<AppError, void>> likeTimesheet(bool value) async {
    return const Left(UnimplementedError());
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
