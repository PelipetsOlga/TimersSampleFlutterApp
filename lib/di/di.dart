import 'package:get_it/get_it.dart';

import '../data/api/auth_api.dart';
import '../data/api/timers_api.dart';
import '../data/repositories/auth_repo.dart';
import '../data/repositories/timers_repo.dart';
import '../domain/repositories/auth_repo.dart';
import '../domain/repositories/timers_repo.dart';

GetIt getIt = GetIt.instance;

void initDI() {
  getIt.registerLazySingleton<AuthApi>(() => AuthApiStub());
  getIt.registerLazySingleton<TimersApi>(() => TimersApiStub());
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt.get<AuthApi>()));
  getIt.registerLazySingleton<TimersRepository>(() => TimersRepositoryImpl(
        getIt.get<TimersApi>(),
        getIt.get<AuthRepository>(),
      ));
}
