import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../api/register_api_service.dart';
import '../models/register/register_request_body.dart';
import '../models/register/register_response.dart';

final registerRepoProvider = Provider.autoDispose<RegisterRepo>((ref) {
  final registerApiService = ref.watch(registerApiServiceProvider);
  return RegisterRepo(registerApiService);
});

class RegisterRepo {
  final RegisterApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterResponse>> register(
    RegisterRequestBody registerRequestBody,
  ) {
    return executeAndHandleErrors<RegisterResponse>(
      () async => await _apiService.register(registerRequestBody),
    );
  }
}
