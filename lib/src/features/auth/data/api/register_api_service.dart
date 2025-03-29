import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/api/dio_factory.dart';
import '../../../../core/api/end_points.dart';
import '../models/auth_response.dart';
import '../models/register_request_body.dart';

part 'register_api_service.g.dart';

final registerApiServiceProvider =
    Provider.autoDispose<RegisterApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return RegisterApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio, {String baseUrl}) = _RegisterApiService;

  @POST(EndPoints.register)
  Future<AuthResponse> register(
    @Body() RegisterRequestBody registerRequestBody, [
    @CancelRequest() CancelToken? cancelToken,
  ]);
}
