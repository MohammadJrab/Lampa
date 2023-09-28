import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/app_router.dart';
import '../../../../utils/styles.dart';
import 'splash_background.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    // Navigate To Onboarding Screen after 2 Sec
    navigateToOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return SplashBackground(
      child: Center(
        child: SimpleShadow(
          opacity: 0.25,
          color: Colors.black, // Default: Black
          offset: const Offset(0, 5), // Default: Offset(2, 2)
          sigma: 2,
          child: Text(
            "لمبة",
            style: Styles.textStyle40,
          ),
        ),
      ),
    );
  }

// Navigate To Home
  void navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.kOnboardingView);
    });
  }
}
