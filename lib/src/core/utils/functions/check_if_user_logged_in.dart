import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../helpers/cache_helper.dart';
import '../../helpers/cache_keys.dart';
import '../../models/user_model.dart';
import '../app_constants.dart';

Future<void> checkIfUserLoggedIn() async {
  final cachedUser = await CacheHelper.getSecuredString(CacheKeys.user);
  if (cachedUser.isNullOrEmpty) {
    isUserLoggedIn = false;
  } else {
    currentUser = await UserModel.getSecuredUser();
    isUserLoggedIn = true;
  }
}
