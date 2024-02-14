import 'package:flutter_test_sample/data/data_utils.dart';

import '../models/user.dart';

part 'auth_stubs.dart';

abstract class AuthApi {
  // This is Stub class instead of REST API
  // In real app we should use Retrofit here

  // HTTP POST
  Future<User> login(String login, String password);
}

class AuthApiStub extends AuthApi {
  @override
  Future<User> login(String login, String password) async {
    return userStub;
  }
}
