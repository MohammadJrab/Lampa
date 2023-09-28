import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lamba/features/Auth/presentation/pages/auth_view.dart';
import 'package:lamba/features/Auth/presentation/pages/confirm_acount.dart';
import 'package:lamba/features/Auth/presentation/pages/congrats_view.dart';
import 'package:lamba/features/Auth/presentation/pages/forget_password.dart';
import 'package:lamba/features/Auth/presentation/pages/policies_and_terms_view.dart';
import 'package:lamba/features/Auth/presentation/pages/sign_with_google_view.dart';
import 'package:lamba/features/Home/presentation/pages/home_view.dart';
import 'package:lamba/features/splash/presentation/pages/onboarding_view.dart';
import '../features/splash/presentation/pages/splash_view.dart';

abstract class AppRouter {
  //  OnBoarding //
  static const kOnboardingView = '/OnboardingView';
  ////
  //  Auth //
  static const kAuthView = '/AuthView';
  static const kForgetPasswordView = '/ForgetPasswordView';
  static const kConfirmAccountView = '/ConfirmAccountView';
  static const kCongratsView = '/CongratsView';
  static const kSignWithGoogleView = '/SignWithGoogleView';
  static const kPoliciesAndTermsView = '/PoliciesAndTermsView';

  ////
  static const kHomeView = '/HomeView';

// GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnboardingView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const Onboarding(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kAuthView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AuthView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kForgetPasswordView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ForgetPasswordView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kConfirmAccountView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ConfirmAccount(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kCongratsView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const Congrats(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kSignWithGoogleView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SignWithGoogleView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kPoliciesAndTermsView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PoliciesAndTermsView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
