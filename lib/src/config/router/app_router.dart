import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:docdoc/dependency_injection.dart';
import 'package:docdoc/src/config/router/routes.dart';
import 'package:docdoc/src/config/themes/app_text_styles.dart';
import 'package:docdoc/src/features/auth/presentation/views/login_view.dart';
import 'package:docdoc/src/features/auth/presentation/views/register_view.dart';
import 'package:docdoc/src/features/home/presentation/cubits/home_cubit.dart';
import 'package:docdoc/src/features/home/presentation/views/home_view.dart';
import 'package:docdoc/src/features/onboarding/presentation/view/onboarding_view.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeCubit>(
            create: (context) => getIt.get<HomeCubit>()..getAllSpecialization(),
            child: const HomeView(),
          ),
        );

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            "Un Found Route",
            style: AppTextStyles.font32Bold,
          ),
        ),
      ),
    );
  }
}
