import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/dio_factory.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/models/doctor.dart';

part 'doctors_api_service.g.dart';

final doctorsApiServiceProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return DoctorsApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class DoctorsApiService {
  factory DoctorsApiService(Dio dio) = _DoctorsApiService;

  @GET(EndPoints.fetchDoctors)
  Future<ApiResponse<List<Doctor>>> fetchDoctors([
    @CancelRequest() CancelToken? cancelToken,
  ]);

  @GET('${EndPoints.filterDoctorsByCity}{cityId}')
  Future<ApiResponse<List<Doctor>>> filterDoctorsByCity(
    @Path('cityId') int cityId, [
    @CancelRequest() CancelToken? cancelToken,
  ]);
}
