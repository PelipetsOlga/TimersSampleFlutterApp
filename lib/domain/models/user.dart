import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final String id;
  final String firstName;
  final String lastName;

  @override
  List<Object> get props => [id, firstName, lastName];
}

UserModel userEmpty = const UserModel(id: "", firstName: "", lastName: "");
