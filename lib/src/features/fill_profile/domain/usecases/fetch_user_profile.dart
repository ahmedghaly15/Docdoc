import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_result.dart';
import '../../../../core/usecases/api_usecase.dart';
import '../../../auth/data/models/auth_response.dart';
import '../../data/repos/fill_profile_repo.dart';

final fetchUserProfileProvider = Provider<FetchUserProfile>((ref) {
  final fillProfileRepo = ref.watch(fillProfileRepoProvider);
  return FetchUserProfile(fillProfileRepo);
});

class FetchUserProfile implements ApiUseCase<AuthResponse, NoParams> {
  final FillProfileRepo _fillProfileRepo;

  FetchUserProfile(this._fillProfileRepo);

  @override
  Future<ApiResult<AuthResponse>> call(NoParams params) {
    return _fillProfileRepo.fetchUserProfile();
  }
}
