part 'doctors_api_service.g.dart';

final doctorsApiServiceProvider = Provider<doctorsApiServiceProvider>(ref(){
  final dio = ref.watch(dioProvider);
  return DoctorsApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class DoctorsApiService{
  factory DoctorsApiService(Dio dio) = _DoctorsApiService;
  
  @GET(EndPoints.fetchDoctors)
  Future<ApiResponse<List<Doctor>>> fetchDoctors(
    [@CancelRequest() CancelToken?,] 
    );
    
    @GET('${EndPoints.filterDoctorsByCity}{cityId}')
    Future<ApiResponse<List<Doctor>>> filterDoctorsByCity(
      @Path('cityId') int cityId,
      [@CancelRequest() CancelToken?,]
      );
}
