final fetchSpecializationsProvider = FutureProvider.family<<ApiResponse<List<Specialization>>>, String>((ref, endPoint) async {
final cancelToken = CancelToken();
final apiResult = await ref.read(specializationsRepoProvider).fetchSpecializations(
  endPoint: endPoint,
  cancelToken: cancelToken,
  );
ref.onDispose(() => cancelToken.cancel());
return apiResult.when(
success: (specializations) => specializations,
failure: (failure) => throw failure.getAllErrorMessages,
);
});

