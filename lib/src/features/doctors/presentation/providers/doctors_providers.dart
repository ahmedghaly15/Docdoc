import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/models/doctor.dart';
import '../../data/repo/doctors_repo.dart';

final fetchDoctorsProvider =
    FutureProvider<ApiResponse<List<Doctor>>>((ref) async {
  final cancelToken = CancelToken();
  final apiResult =
      await ref.read(doctorsRepoProvider).fetchDoctors(cancelToken);
  ref.onDispose(() => cancelToken.cancel());
  return apiResult.when(
    success: (doctors) => doctors,
    failure: (failure) => throw failure.getAllErrorMessages,
  );
});

final filteredDoctorsByCityProvider = FutureProvider.autoDispose
    .family<ApiResponse<List<Doctor>>, int>((ref, cityId) async {
  final cancelToken = CancelToken();
  final apiResult = await ref
      .read(doctorsRepoProvider)
      .filterDoctorsByCity(cityId, cancelToken);
  ref.onDispose(() => cancelToken.cancel());
  return apiResult.when(
    success: (filteredDoctors) => filteredDoctors,
    failure: (failure) => throw failure.getAllErrorMessages,
  );
});
