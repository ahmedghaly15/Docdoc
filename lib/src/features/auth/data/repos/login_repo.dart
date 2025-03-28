import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../api/login_api_service.dart';
import '../models/auth_response.dart';
import '../models/login_request_body.dart';

final loginRepoProvider = Provider.autoDispose<LoginRepo>((ref) {
  final loginApiService = ref.watch(loginApiServiceProvider);
  return LoginRepo(loginApiService);
});

class LoginRepo {
  final LoginApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<AuthResponse>> login(
    LoginRequestBody loginRequestBody,
  ) {
    return executeAndHandleErrors<AuthResponse>(
      () async => await _apiService.login(loginRequestBody),
    );
  }
}
