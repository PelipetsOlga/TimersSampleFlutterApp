import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final int id;
  final String firstName;
  final String lastName;

  @override
  List<Object> get props => [id, firstName, lastName];
}
