import 'package:docdoc/app_provider_observer.dart';
import 'package:docdoc/bloc_observer.dart';
import 'package:docdoc/dependency_injection.dart';
import 'package:docdoc/src/core/utils/functions/check_if_onboarding_is_visited.dart';
import 'package:docdoc/src/core/utils/functions/check_if_user_logged_in.dart';
import 'package:docdoc/src/docdoc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfOnboardingIsVisited();
  await checkIfUserLoggedIn();
  Bloc.observer = MyBlocObserver();
  runApp(ProviderScope(
    observers: [AppProviderObserver()],
    child: const DocdocApp(),
  ));
}
