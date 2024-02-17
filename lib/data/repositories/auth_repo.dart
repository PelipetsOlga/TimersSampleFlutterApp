import 'package:either_dart/either.dart';
import 'dart:async';

import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../api/auth_api.dart';
import '../../domain/models/errors.dart';
import '../models/user.dart';

part 'auth_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthApi api;

  AuthRepositoryImpl(this.api);

  UserModel? cache;

  @override
  Future<Either<AppError, UserModel>> auth(String login, String password) async {
    try {
      User user = await api.login(login, password);
      var toDomain = _toUserDomain(user);
      cache = toDomain;
      return Right(toDomain);
    } catch (e) {
      return const Left(AuthorisationError());
    }
  }

  @override
  Future<Either<AppError, UserModel>> profile() async {
    if (cache != null) return Right(cache!);
    return const Left(UnAuthorizedError());
  }
}
