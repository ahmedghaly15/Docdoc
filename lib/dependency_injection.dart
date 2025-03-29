import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:docdoc/src/core/api/api_service.dart';
import 'package:docdoc/src/core/api/dio_factory.dart';
import 'package:docdoc/src/features/home/data/repos/home_repo.dart';
import 'package:docdoc/src/features/home/presentation/cubits/home_cubit.dart';

part 'src/core/di/setup_di_for_core.dart';
part 'src/core/di/setup_di_for_cubits.dart';
part 'src/core/di/setup_di_for_repos.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  setupDIForCore();
  setupDIForRepos();
  setupDIForCubits();
}
