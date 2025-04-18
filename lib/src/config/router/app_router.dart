import 'package:flutter/material.dart';

import '../../core/utils/app_constants.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/doctors/presentation/views/recommended_doctors_view.dart';
import '../../features/fill_profile/presentation/views/fill_profile_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import '../../features/specializations/presentation/views/specializations_view.dart';
import '../themes/app_text_styles.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return isOnboardingVisited
            ? (isUserLoggedIn ? _homeRoute() : _loginRoute())
            : _onboardingRoute();

      case Routes.onboarding:
        return _onboardingRoute();

      case Routes.login:
        return _loginRoute();

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      case Routes.fillProfile:
        return MaterialPageRoute(
          builder: (_) => const FillProfileView(),
        );

      case Routes.home:
        return _homeRoute();

      case Routes.recommendedDoctors:
        return MaterialPageRoute(
          builder: (_) => const RecommendedDoctorsView(),
        );

      case Routes.specializations:
        return MaterialPageRoute(
          builder: (_) => const SpecializationsView(),
        );

      default:
        return _unFoundRoute();
    }
  }

  static MaterialPageRoute<dynamic> _homeRoute() {
    return MaterialPageRoute(
      builder: (_) => const HomeView(),
    );
  }

  static MaterialPageRoute<dynamic> _loginRoute() {
    return MaterialPageRoute(
      builder: (_) => const LoginView(),
    );
  }

  static MaterialPageRoute<dynamic> _onboardingRoute() {
    return MaterialPageRoute(
      builder: (_) => const OnboardingView(),
    );
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
