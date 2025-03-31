import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioLoggerInterceptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('*** Request ***');
    _logger.i('URL: ${options.uri}');
    _logger.i('Method: ${options.method}');
    _logger.i('Headers: ${options.headers}');
    _logger.i('Body: ${options.data}');
    super.onRequest(options, handler); // Pass the request to the next handler
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i('*** Response ***');
    _logger.i('URL: ${response.requestOptions.uri}');
    _logger.i('Status Code: ${response.statusCode}');
    _logger.i('Response Body: ${response.data}');
    super
        .onResponse(response, handler); // Pass the response to the next handler
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e('*** Error ***');
    _logger.e('URL: ${err.requestOptions.uri}');
    _logger.e('Error Message: ${err.message}');
    if (err.response != null) {
      _logger.e('Status Code: ${err.response?.statusCode}');
      _logger.e('Error Body: ${err.response?.data}');
    }
    super.onError(err, handler); // Pass the error to the next handler
  }
}
