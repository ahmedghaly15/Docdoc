import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/api_result.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../../../auth/data/models/register_request_body.dart';
import '../api/fill_profile_api_service.dart';

final fillProfileRepoProvider = Provider<FillProfileRepo>((ref) {
  final apiService = ref.watch(fillProfileApiServiceProvider);
  return FillProfileRepo(apiService);
});

class FillProfileRepo {
  final FillProfileApiService _apiService;

  FillProfileRepo(this._apiService);

  Future<ApiResult<ApiResponse<List<UserModel>>>> fetchUserProfile() {
    return executeAndHandleErrors<ApiResponse<List<UserModel>>>(
      () async => await _apiService.fetchUserProfile(),
    );
  }

  Future<ApiResult<ApiResponse<UserModel>>> updateProfile(
    RegisterRequestBody requestBody,
  ) {
    return executeAndHandleErrors<ApiResponse<UserModel>>(
      () async => await _apiService.updateProfile(requestBody),
    );
  }
}
