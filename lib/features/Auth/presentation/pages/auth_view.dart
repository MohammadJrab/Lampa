import 'package:flutter/material.dart';
import 'package:lamba/features/Auth/presentation/widgets/auth_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AuthBody()),
    );
  }
}
