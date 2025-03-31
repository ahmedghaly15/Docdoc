import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/core/utils/functions/check_if_onboarding_is_visited.dart';
import 'src/core/utils/functions/check_if_user_logged_in.dart';
import 'src/docdoc_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To fix texts being hidden bug in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfOnboardingIsVisited();
  await checkIfUserLoggedIn();
  runApp(
    const ProviderScope(child: DocdocApp()),
  );
}
