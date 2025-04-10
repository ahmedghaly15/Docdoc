part 'appointment_provider.g.dart';

final fetchAppointmentsProvider = FutureProvider<ApiResponse<List<Appointment>>>((ref) async {
final apiResult = await ref.read(appointmentRepo).fetchAppointments();
return apiResult.when(
success: (appointments) => appointments,
failure: (failure) => throw failure.getAllErrorMessages,
);
});

@riverpod
class Appointment extends _$Appointment{
@override
AsyncValue<ApiResponse<Appointment>>? build() {
return null;
}

void storeAppointment(
StoreAppointmentRequestBody requestBody,
) async{
state = const AsyncValue.loading();
final cancelToken = CancelToken();
final apiResult = await ref.read(appointmentRepoProvider).storeAppointment(requestBody, cancelToken);
ref.onDispose(() => cancelToken.cancel());
apiResult.when(
success: (appointment) => state = AsyncValue.data(appointment),
failure: (failure) => state = AsyncValue.error(failure.getAllErrorMessages),
);
}
}
