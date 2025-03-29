import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../../../auth/data/models/auth_response.dart';
import '../../../auth/data/models/register_request_body.dart';
import '../api/fill_profile_api_service.dart';

final fillProfileRepoProvider = Provider<FillProfileRepo>((ref) {
  final apiService = ref.watch(fillProfileApiServiceProvider);
  return FillProfileRepo(apiService);
});

class FillProfileRepo {
  final FillProfileApiService _apiService;

  FillProfileRepo(this._apiService);

  Future<ApiResult<AuthResponse>> fetchUserProfile() {
    return executeAndHandleErrors(
      () async => await _apiService.fetchUserProfile(),
    );
  }

  Future<ApiResult<AuthResponse>> updateProfile(
    RegisterRequestBody requestBody,
  ) {
    return executeAndHandleErrors(
      () async => await _apiService.updateProfile(requestBody),
    );
  }
}
