import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taxi_app/features/auth/presentation/view/auth_screen.dart';
import 'package:taxi_app/features/auth/presentation/view/login_view.dart';
import 'package:taxi_app/features/auth/presentation/view/signup_view.dart';
import 'package:taxi_app/features/google_map/view/map_screen.dart';
import 'package:taxi_app/features/onboarding/view/onboarding_view.dart';

abstract class AppRouter {
  static const kMapScreen = '/mapView';
  static const kOnboardingView = '/onboardingView';
  static const kAuthScreen = '/authScreen';
  static const kSignupView = '/signupView';
  static const kLoginView = '/loginView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
      GoRoute(
        path: kMapScreen,
        name: kMapScreen,
        builder: (context, state) => const MapScreen(),
      ),
      GoRoute(
        path: kLoginView,
        name: kLoginView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginView(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final slide =
                Tween<Offset>(
                  begin: const Offset(-0.2, 0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOutCubic,
                  ),
                );
            final fade = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
            return SlideTransition(
              position: slide,
              child: FadeTransition(opacity: fade, child: child),
            );
          },
        ),
      ),
      GoRoute(
        path: kSignupView,
        name: kSignupView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignupView(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final slide =
                Tween<Offset>(
                  begin: const Offset(-0.2, 0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
                );
            final fade = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
            return SlideTransition(
              position: slide,
              child: FadeTransition(opacity: fade, child: child),
            );
          },
        ),
      ),
      GoRoute(
        path: kAuthScreen,
        name: kAuthScreen,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AuthScreen(),
          transitionDuration: const Duration(milliseconds: 380),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInToLinear,
            );
            return FadeTransition(
              opacity: curved,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.96, end: 1.0).animate(curved),
                child: child,
              ),
            );
          },
        ),
      ),
    ],
  );
}
