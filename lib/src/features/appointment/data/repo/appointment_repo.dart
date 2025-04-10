import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/api_result.dart';
import '../models/appointment.dart';
import '../models/store_appointment_request_body.dart';
import '../api/appointment_api_service.dart';

final appointmentRepoProvider = Provider<AppointmentRepo>((ref){
final apiService = ref.watch(appointmentApiServiceProvider);
return AppointmentRepo(apiService);
});

class AppointmentRepo{
final AppointmentApiService _apiService;
AppointmentRepo(this._apiService);

Future<ApiResult<ApiResponse<Appointment>>> storeAppointment(
StoreAppointmentRequestBody requestBody,
[CancelToken? cancelToken,]
) {
return executeAndHandleErrors<ApiResponse<Appointment>>(() async => await _apiService.storeAppointment(requestBody, cancelToken));
}

Future<ApiResult<ApiResponse<List<Appointment>>>> fetchAppointments() {
return executeAndHandleErrors<ApiResponse<List<Appointment>>>(() async => await _apiService.fetchAppointments());
}
}
