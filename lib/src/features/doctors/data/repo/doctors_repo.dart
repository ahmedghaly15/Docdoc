fina doctorsRepoProvider = Provider<DoctorsRepo>((ref) {
final doctorsApiService = ref.watch(doctorsApiServiceProvider);
return DoctorsRepo(doctorsApiService);
});

class DoctorsRepo{
final DoctorsApiService _apiService;
DoctorsRepo(this._apiService);

Furure<ApiResult<ApiResponse<List<Doctor>>>> fetchDoctors(
[CancelToken? cancelToken,]
) {
return executeAndHandleErrors<ApiResponse<List<Doctor>>>(
() async => await _apiService.fetchDoctors(cancelToken)
);
}

Future<ApiResult<ApiResponse<List<Doctor>>>> filterDoctorsByCity(
int cityId,
[cancelToken? cancelToken,]
) {
return executeAndHandleErrors<ApiResponse<List<Doctor>>>(() async => await _apiService.filterDoctorsByCity(cityId, cancelToken));
}
}
