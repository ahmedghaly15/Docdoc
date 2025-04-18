import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/models/specialization.dart';
import '../../data/repo/specializations_repo.dart';

final fetchSpecializationsProvider =
    FutureProvider<ApiResponse<List<Specialization>>>((ref) async {
  final cancelToken = CancelToken();
  final apiResult = await ref
      .read(specializationsRepoProvider)
      .fetchSpecializations(cancelToken);
  ref.onDispose(() => cancelToken.cancel());
  return apiResult.when(
    success: (specializations) => specializations,
    failure: (failure) => throw failure.getAllErrorMessages,
  );
});
