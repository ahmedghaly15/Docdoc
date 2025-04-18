import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/api_result.dart';
import '../../../../core/models/specialization.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../api/specializations_api_service.dart';

final specializationsRepoProvider = Provider<SpecializationsRepo>((ref) {
  final apiService = ref.watch(specializationsApiServiceProvider);
  return SpecializationsRepo(apiService);
});

class SpecializationsRepo {
  final SpecializationsApiService _apiService;
  SpecializationsRepo(this._apiService);

  Future<ApiResult<ApiResponse<List<Specialization>>>> fetchSpecializations([
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<ApiResponse<List<Specialization>>>(
      () async => await _apiService.fetchSpecializations(cancelToken),
    );
  }
}
