import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../models/user_model.dart';
import '../app_constants.dart';

Future<void> checkIfUserLoggedIn() async {
  final user = await UserModel.getSecuredUser();
  if (user != null && user.token.isNullOrEmpty) {
    isUserLoggedIn = false;
  } else {
    currentUser = user;
    isUserLoggedIn = true;
  }
}
