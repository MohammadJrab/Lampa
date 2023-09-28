import 'package:flutter/material.dart';
import 'package:lamba/features/splash/presentation/widgets/onboarding_body.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingBody(),
    );
  }
}
