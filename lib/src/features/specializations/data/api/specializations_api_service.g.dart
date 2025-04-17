// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specializations_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SpecializationsApiService implements SpecializationsApiService {
  _SpecializationsApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= EndPoints.baseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<List<Specialization>>> fetchSpecializations({
    required String endPoint,
    CancelToken? cancelToken,
  }) async {
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<ApiResponse<List<Specialization>>>(
        Options(
          method: 'GET',
          headers: _headers,
        ).compose(
          _dio.options,
          endPoint,
          queryParameters: queryParameters,
          data: _data,
        ).copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ).copyWith(cancelToken: cancelToken),
    );

    final value = ApiResponse<List<Specialization>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map((e) => Specialization.fromJson(e as Map<String, dynamic>))
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
