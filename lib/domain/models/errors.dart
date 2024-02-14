import 'package:equatable/equatable.dart';
import 'dart:core';

sealed class Error extends Equatable {
  const Error(this.msg);

  final String msg;

  @override
  List<Object> get props => [msg];
}

class UnimplementedError extends Error {
  const UnimplementedError() : super("Unimplemented Error");
}

class UnAuthorizedError extends Error {
  const UnAuthorizedError() : super("User should login");
}

class AuthorisationError extends Error {
  const AuthorisationError() : super("Login or password are incorrect. Try again.");
}
