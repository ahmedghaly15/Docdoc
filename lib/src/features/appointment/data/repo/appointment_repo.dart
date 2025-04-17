import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/api_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../models/appointment_model.dart';
import '../models/store_appointment_request_body.dart';
import '../api/appointment_api_service.dart';

final appointmentRepoProvider = Provider<AppointmentRepo>((ref) {
  final apiService = ref.watch(appointmentApiServiceProvider);
  return AppointmentRepo(apiService);
});

class AppointmentRepo {
  final AppointmentApiService _apiService;
  AppointmentRepo(this._apiService);

  Future<ApiResult<ApiResponse<AppointmentModel>>> storeAppointment(
    StoreAppointmentRequestBody requestBody, [
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<ApiResponse<AppointmentModel>>(
      () async => await _apiService.storeAppointment(requestBody, cancelToken),
    );
  }

  Future<ApiResult<ApiResponse<List<AppointmentModel>>>> fetchAppointments() {
    return executeAndHandleErrors<ApiResponse<List<AppointmentModel>>>(
      () async => await _apiService.fetchAppointments(),
    );
  }
}
