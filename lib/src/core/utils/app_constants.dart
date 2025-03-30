import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/user_model.dart';

bool isUserLoggedIn = false;
bool isOnboardingVisited = false;
UserModel? currentUser;

class AppConstants {
  AppConstants._();

  static double screenHorizontalPadding = 30.w;
}
