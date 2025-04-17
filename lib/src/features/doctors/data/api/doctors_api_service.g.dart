// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DoctorsApiService implements DoctorsApiService {
  _DoctorsApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= EndPoints.baseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<List<Doctor>>> fetchDoctors([
    CancelToken? cancelToken,
  ]) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<ApiResponse<List<Doctor>>>(
        Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        ).compose(
          _dio.options,
          'doctor/index',
          queryParameters: queryParameters,
          data: _data,
        ).copyWith(
          baseUrl: baseUrl ?? _dio.options.baseUrl,
          cancelToken: cancelToken,
        ),
      ),
    );

    final value = ApiResponse<List<Doctor>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return value;
  }

  @override
  Future<ApiResponse<List<Doctor>>> filterDoctorsByCity(
    int cityId, [
    CancelToken? cancelToken,
  ]) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<ApiResponse<List<Doctor>>>(
        Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        ).compose(
          _dio.options,
          'doctor/doctor-filter/$cityId',
          queryParameters: queryParameters,
          data: _data,
        ).copyWith(
          baseUrl: baseUrl ?? _dio.options.baseUrl,
          cancelToken: cancelToken,
        ),
      ),
    );

    final value = ApiResponse<List<Doctor>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      requestOptions = requestOptions.copyWith(
        responseType: T == String ? ResponseType.plain : ResponseType.json,
      );
    }
    return requestOptions;
  }
}
