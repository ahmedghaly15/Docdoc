part of '../../../dependency_injection.dart';

void setupDIForCubits() {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt.get<HomeRepo>()),
  );
}
