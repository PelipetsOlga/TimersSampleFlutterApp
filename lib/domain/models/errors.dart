import 'package:equatable/equatable.dart';
import 'dart:core';

sealed class AppError extends Equatable {
  const AppError(this.msg);

  final String msg;

  @override
  List<Object> get props => [msg];
}

class UnimplementedError extends AppError {
  const UnimplementedError() : super("Unimplemented Error");
}

class UnAuthorizedError extends AppError {
  const UnAuthorizedError() : super("User should login");
}

class AuthorisationError extends AppError {
  const AuthorisationError() : super("Login or password are incorrect. Try again.");
}
