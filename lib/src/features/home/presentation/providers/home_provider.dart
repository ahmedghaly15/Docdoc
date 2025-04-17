import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/models/specialization.dart';
import '../../data/repos/home_repo.dart';

final fetchHomeSpecializationsProvider =
    FutureProvider<ApiResponse<List<Specialization>>>((ref) async {
  final apiResponse = await ref.read(homeRepoProvider).getSpecializations();
  return apiResponse.when(
    success: (specializations) => specializations,
    failure: (failure) => throw failure.getAllErrorMessages,
  );
});
