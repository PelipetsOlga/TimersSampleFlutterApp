import 'package:either_dart/either.dart';
import 'dart:async';

import '../models/user.dart';

abstract interface class AuthRepository {

  Future<Either<Error, User>> auth(String login, String password);

}