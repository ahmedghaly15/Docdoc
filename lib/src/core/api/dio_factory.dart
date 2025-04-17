import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/app_constants.dart';
import 'dio_logger_interceptor.dart';

final dioProvider = Provider<Dio>((ref) => DioFactory.getDio());

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    const Duration timeOut = Duration(seconds: 30);
    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${currentUser?.token}',
        };
      // _addDioHeaders();
      _addDioLoggerInterceptor();
      return _dio!;
    } else {
      return _dio!;
    }
  }

  // static void _addDioHeaders() async {
  //   final user = await UserModel.getSecuredUser();
  //   debugPrint('DIO USER: ${user.toString()}');
  //   _dio!.options.headers = {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${user!.token}',
  //   };
  // }

  static void setTokenIntoHeaders(String token) {
    _dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void _addDioLoggerInterceptor() {
    _dio?.interceptors.add(DioLoggerInterceptor());
  }
}
