import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/dio_factory.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/models/specialization.dart';

part 'specializations_api_service.g.dart';

final specializationsApiServiceProvider =
    Provider<SpecializationsApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return SpecializationsApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class SpecializationsApiService {
  factory SpecializationsApiService(Dio dio) = _SpecializationsApiService;

  @GET(EndPoints.fetchSpecializations)
  Future<ApiResponse<List<Specialization>>> fetchSpecializations([
    @CancelRequest() CancelToken? cancelToken,
  ]);
}
