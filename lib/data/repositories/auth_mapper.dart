part of 'auth_repo.dart';

UserModel _toUserDomain(User user) {
  return UserModel(
    id: user.id,
    firstName: user.firstName,
    lastName: user.lastName,
  );
}
