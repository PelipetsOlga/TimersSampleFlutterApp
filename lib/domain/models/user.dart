import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
    this.id,
    this.firstName,
    this.lastName,
  );

  final int id;
  final String firstName;
  final String lastName;

  @override
  List<Object> get props => [id, firstName, lastName];
}
