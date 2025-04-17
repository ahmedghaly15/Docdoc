import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/api/api_response.dart';
import '../../data/models/appointment_model.dart';
import '../../data/models/store_appointment_request_body.dart';
import '../../data/repo/appointment_repo.dart';

part 'appointment_provider.g.dart';

final fetchAppointmentsProvider = FutureProvider((ref) async {
  final apiResult = await ref.read(appointmentRepoProvider).fetchAppointments();
  return apiResult.when(
    success: (appointments) => appointments,
    failure: (failure) => throw failure.getAllErrorMessages,
  );
});

@riverpod
class Appointment extends _$Appointment {
  @override
  AsyncValue<ApiResponse<AppointmentModel>>? build() {
    return null;
  }

  void storeAppointment(
    StoreAppointmentRequestBody requestBody,
  ) async {
    state = const AsyncValue.loading();
    final cancelToken = CancelToken();
    final apiResult = await ref
        .read(appointmentRepoProvider)
        .storeAppointment(requestBody, cancelToken);
    ref.onDispose(() => cancelToken.cancel());
    apiResult.when(
      success: (appointment) => state = AsyncValue.data(appointment),
      failure: (failure) => state =
          AsyncValue.error(failure.getAllErrorMessages, StackTrace.current),
    );
  }
}
