import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/dio_factory.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/models/specialization.dart';

part 'home_api_service.g.dart';

final homeApiServiceProvider = Provider<HomeApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(EndPoints.specialization)
  Future<ApiResponse<List<Specialization>>> getSpecializations();
}
