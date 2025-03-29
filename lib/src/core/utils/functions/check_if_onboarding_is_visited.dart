import '../../helpers/cache_helper.dart';
import '../../helpers/cache_keys.dart';

Future<void> checkIfOnboardingIsVisited() async {
  bool? onboarding = await CacheHelper.getBool(CacheKeys.onboarding);
  if (onboarding != null) {
    isOnboardingVisited = onboarding;
  } else {
    isOnboardingVisited = false;
  }
}
