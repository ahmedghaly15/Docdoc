import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/dio_factory.dart';
import '../../../../core/api/end_points.dart';
import '../models/appointment_model.dart';
import '../models/store_appointment_request_body.dart';

part 'appointment_api_service.g.dart';

final appointmentApiServiceProvider = Provider<AppointmentApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return AppointmentApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AppointmentApiService {
  factory AppointmentApiService(Dio dio) = _AppointmentApiService;

  @GET(EndPoints.fetchAppointments)
  Future<ApiResponse<List<AppointmentModel>>> fetchAppointments();

  @POST(EndPoints.storeAppointment)
  Future<ApiResponse<AppointmentModel>> storeAppointment(
    @Body() StoreAppointmentRequestBody requestBody, [
    @CancelRequest() CancelToken? cancelToken,
  ]);
}
