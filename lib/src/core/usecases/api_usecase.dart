import '../api/api_result.dart';

abstract class ApiUseCase<Type, Params> {
  Future<ApiResult<Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
