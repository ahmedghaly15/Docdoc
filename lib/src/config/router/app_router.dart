import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/fill_profile/presentation/views/fill_profile_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../themes/app_text_styles.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      case Routes.fillProfile:
        return MaterialPageRoute(
          builder: (_) => const FillProfileView(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
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
