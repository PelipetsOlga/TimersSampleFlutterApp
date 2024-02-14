import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final int id;
  final String firstName;
  final String lastName;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
