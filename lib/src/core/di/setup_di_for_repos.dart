part of '../../../dependency_injection.dart';

void setupDIForRepos() {
  // getIt.registerLazySingleton<LoginRepo>(
  //   () => LoginRepo(getIt.get<ApiService>()),
  // );

  // getIt.registerLazySingleton<RegisterRepo>(
  //   () => RegisterRepoImpl(getIt.get<ApiService>()),
  // );

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(getIt.get<ApiService>()),
  );
}
