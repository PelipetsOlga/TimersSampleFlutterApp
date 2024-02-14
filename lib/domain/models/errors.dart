import 'package:equatable/equatable.dart';
import 'dart:core';

class Error extends Equatable {
  const Error(this.msg);

  final String msg;

  @override
  List<Object> get props => [msg];
}
