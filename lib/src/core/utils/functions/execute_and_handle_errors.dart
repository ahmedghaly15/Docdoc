import 'package:flutter/material.dart';

import 'package:docdoc/src/core/api/api_error_handler.dart';
import 'package:docdoc/src/core/api/api_result.dart';

Future<ApiResult<T>> executeAndHandleErrors<T>(
  Future Function() function,
) async {
  try {
    return ApiResult.success(await function());
  } catch (error) {
    debugPrint('********* Error in executeAndHandleErrors: $error **********');
    return ApiResult.failure(ApiErrorHandler.handle(error));
  }
}
