import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../helpers/cache_keys.dart';
import '../../models/user_model.dart';

Future<void> checkIfUserLoggedIn() async {
  final user = await UserModel.getSecuredUser();
  if (user != null && user.token.isNullOrEmpty) {
    isUserLoggedIn = false;
  } else {
    isUserLoggedIn = true;
  }
}
