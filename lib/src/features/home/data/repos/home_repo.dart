import 'package:docdoc/src/core/utils/functions/execute_and_handle_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/api_result.dart';
import '../api/home_api_service.dart';
import '../models/specialization.dart';

final homeRepoProvider = Provider<HomeRepo>((ref) {
  final homeApiService = ref.watch(homeApiServiceProvider);
  return HomeRepo(homeApiService);
});

class HomeRepo {
  final HomeApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<ApiResponse<List<Specialization>>>> getAllSpecialization() {
    return executeAndHandleErrors<ApiResponse<List<Specialization>>>(
      () async => await _apiService.getAllSpecialization(),
    );
  }
}
