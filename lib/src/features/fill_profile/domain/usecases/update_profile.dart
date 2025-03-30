import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/api_result.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/usecases/api_usecase.dart';
import '../../../auth/data/models/register_request_body.dart';
import '../../data/repos/fill_profile_repo.dart';

final updateProfileProvider = Provider<UpdateProfile>((ref) {
  final fillProfileRepo = ref.watch(fillProfileRepoProvider);
  return UpdateProfile(fillProfileRepo);
});

class UpdateProfile
    implements ApiUseCase<ApiResponse<UserModel>, RegisterRequestBody> {
  final FillProfileRepo _fillProfileRepo;

  UpdateProfile(this._fillProfileRepo);

  @override
  Future<ApiResult<ApiResponse<UserModel>>> call(RegisterRequestBody params) {
    return _fillProfileRepo.updateProfile(params);
  }
}
