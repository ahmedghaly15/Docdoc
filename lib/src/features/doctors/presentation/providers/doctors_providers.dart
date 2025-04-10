final fetchDoctorsProvider = FutureProvider<ApiResponse<List<Doctor>>>((ref) async{
final cancelToken = CancelToken();
final apiResult = await ref.read(doctorsRepoProvider).fetchDoctors(cancelToken);
ref.onDispose(() => cancelToken.cancel());
return apiResult.when(
success: (doctors) => doctors,
failure: (failure) => throw failure.getAllErrorMessages,
);
});

final filteredDoctorsByCityProvider = FutureProvider.family<<ApiResponse<List<Doctor>>>, int>((ref, cityId) async{
  final cancelToken = CancelToken();
  final apiResult = await ref.read(doctorsRepoProvider).filterDoctorsByCity(cityId, cancelToken);
  ref.onDispose(() => cancelToken.cancel());
  return apiResult.when(
    success: (filteredDoctors) => filteredDoctors,
    failure: (failure) => throw failure.getAllErrorMessages,
    );
});
