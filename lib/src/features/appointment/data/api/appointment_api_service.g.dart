// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AppointmentApiService implements AppointmentApiService {
  _AppointmentApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= EndPoints.baseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<List<Appointment>>> fetchAppointments() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<ApiResponse<List<Appointment>>>(
        Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        ).compose(
          _dio.options,
          'appointment/index',
          queryParameters: queryParameters,
          data: _data,
        ).copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );

    final value = ApiResponse<List<Appointment>>.fromJson(
      _result.data!,
      (json) => (json as List<dynamic>)
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return value;
  }

  @override
  Future<ApiResponse<Appointment>> storeAppointment(
    StoreAppointmentRequestBody requestBody, [
    CancelToken? cancelToken,
  ]) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = requestBody.toJson();

    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<ApiResponse<Appointment>>(
        Options(
          method: 'POST',
          headers: _headers,
          extra: _extra,
        ).compose(
          _dio.options,
          'appointment/store',
          queryParameters: queryParameters,
          data: _data,
        ).copyWith(
          baseUrl: baseUrl ?? _dio.options.baseUrl,
          cancelToken: cancelToken,
        ),
      ),
    );

    final value = ApiResponse<Appointment>.fromJson(
      _result.data!,
      (json) => Appointment.fromJson(json as Map<String, dynamic>),
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

