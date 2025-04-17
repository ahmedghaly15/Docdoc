import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/api_result.dart';
import '../../../../core/models/doctor.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../api/doctors_api_service.dart';

final doctorsRepoProvider = Provider<DoctorsRepo>((ref) {
  final doctorsApiService = ref.watch(doctorsApiServiceProvider);
  return DoctorsRepo(doctorsApiService);
});

class DoctorsRepo {
  final DoctorsApiService _apiService;
  DoctorsRepo(this._apiService);

  Future<ApiResult<ApiResponse<List<Doctor>>>> fetchDoctors([
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<ApiResponse<List<Doctor>>>(
      () async => await _apiService.fetchDoctors(cancelToken),
    );
  }

  Future<ApiResult<ApiResponse<List<Doctor>>>> filterDoctorsByCity(
    int cityId, [
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<ApiResponse<List<Doctor>>>(
      () async => await _apiService.filterDoctorsByCity(cityId, cancelToken),
    );
  }
}
