import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/dio_factory.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/models/user_model.dart';
import '../../../auth/data/models/register_request_body.dart';

part 'fill_profile_api_service.g.dart';

final fillProfileApiServiceProvider = Provider<FillProfileApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return FillProfileApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class FillProfileApiService {
  factory FillProfileApiService(Dio dio) = _FillProfileApiService;

  @GET(EndPoints.fetchUserProfile)
  Future<ApiResponse<List<UserModel>>> fetchUserProfile();

  @POST(EndPoints.updateUserProfile)
  Future<ApiResponse<UserModel>> updateProfile(
    @Body() RegisterRequestBody requestBody,
  );
}
