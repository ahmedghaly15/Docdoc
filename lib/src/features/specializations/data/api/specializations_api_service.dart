part 'specializations_api_service.g.dart';

final specializationsApiServiceProvider = Provider<SpecializationsApiService>((ref){
  final dio = ref.watch(dioProvider);
  return SpecializationsApiService(dio);
});

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class SpecializationsApiService{
factory SpecializationsApiService(Dio dio) = _SpecializationsApiService;

@GET("")
Future<ApiResponse<List<Specialization>>> fetchSpecializations(
  {
    @Url() required String endPoint,
    @CancelRequest() CancelToken? cancelToken,
  }
);
}
