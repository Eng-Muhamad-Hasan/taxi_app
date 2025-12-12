import 'package:flutter/material.dart';
import 'package:taxi_app/features/google_map/view/map_screen.dart';
import 'package:taxi_app/features/onboarding/view/onboarding_view.dart';

import '../../features/auth/presentation/view/login_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MapScreen.routeName:
      return MaterialPageRoute(builder: (context) => const MapScreen());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
