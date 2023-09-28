import 'package:flutter/material.dart';
import 'package:lamba/features/Auth/presentation/widgets/sign_with_google_body.dart';

class SignWithGoogleView extends StatelessWidget {
  const SignWithGoogleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignWithGoogleBody(),
      ),
    );
  }
}
