final specializationsRepoProvider = Provider<SpecializationsRepo>((ref){
final apiService = ref.watch(specializationsApiServiceProvider);
return SpecializationsRepo(apiService);
});

class SpecializationsRepo{
final SpecializationsApiService _apiService;
SpecializationsRepo(this._apiService);

Future<ApiResult<ApiResponse<List<Specialization> fetchSpecializations({
  required String endPoint, 
  CancelToken? cancelToken,
}) {
return executeAndHandleErrors<ApiResponse<List<Specialization>>>(() async => await _apiService.fetchSpecializations(
endPoint: endPoint,
cancelToken: cancelToken,
));
}
}
