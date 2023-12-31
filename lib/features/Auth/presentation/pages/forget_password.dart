import 'package:flutter/material.dart';
import 'package:lamba/features/Auth/presentation/widgets/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ForgetPasswordBody(),
      ),
    );
  }
}
