import 'package:either_dart/either.dart';
import 'dart:async';

import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../api/auth_api.dart';
import '../../domain/models/errors.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthApi api;

  AuthRepositoryImpl(this.api);

  User? cache;

  @override
  Future<Either<Error, User>> auth(String login, String password) async {
    return const Left(UnimplementedError());
  }

  @override
  Future<Either<Error, User>> profile() async {
    if (cache != null) return Right(cache!);
    return const Left(UnAuthorizedError());
  }
}
