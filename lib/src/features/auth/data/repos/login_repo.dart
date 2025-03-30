import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/api_result.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../api/login_api_service.dart';
import '../models/login_request_body.dart';

final loginRepoProvider = Provider.autoDispose<LoginRepo>((ref) {
  final loginApiService = ref.watch(loginApiServiceProvider);
  return LoginRepo(loginApiService);
});

class LoginRepo {
  final LoginApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<ApiResponse<UserModel>>> login(
    LoginRequestBody loginRequestBody, [
    CancelToken? cancelToken,
  ]) {
    return executeAndHandleErrors<ApiResponse<UserModel>>(
      () async => await _apiService.login(loginRequestBody, cancelToken),
    );
  }
}
