import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/dio_factory.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/models/user_model.dart';
import '../models/login_request_body.dart';

part 'login_api_service.g.dart';

final loginApiServiceProvider = Provider.autoDispose<LoginApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return LoginApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(EndPoints.login)
  Future<ApiResponse<UserModel>> login(
    @Body() LoginRequestBody loginRequestBody, [
    @CancelRequest() CancelToken? cancelToken,
  ]);
}
