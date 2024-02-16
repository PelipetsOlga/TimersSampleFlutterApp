import 'package:either_dart/either.dart';
import 'dart:async';

import '../models/user.dart';
import '../../domain/models/errors.dart';

abstract interface class AuthRepository {

  Future<Either<AppError, UserModel>> auth(String login, String password);

  Future<Either<AppError, UserModel>> profile();

}