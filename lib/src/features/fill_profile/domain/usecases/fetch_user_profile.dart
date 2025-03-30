import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/api_result.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/usecases/api_usecase.dart';
import '../../data/repos/fill_profile_repo.dart';

final fetchUserProfileProvider = Provider<FetchUserProfile>((ref) {
  final fillProfileRepo = ref.watch(fillProfileRepoProvider);
  return FetchUserProfile(fillProfileRepo);
});

class FetchUserProfile
    implements ApiUseCase<ApiResponse<List<UserModel>>, NoParams> {
  final FillProfileRepo _fillProfileRepo;

  FetchUserProfile(this._fillProfileRepo);

  @override
  Future<ApiResult<ApiResponse<List<UserModel>>>> call(NoParams params) {
    return _fillProfileRepo.fetchUserProfile();
  }
}
