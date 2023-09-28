import 'package:flutter/material.dart';

import '../widgets/confirm_account_body.dart';

class ConfirmAccount extends StatelessWidget {
  const ConfirmAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ConfirmAccountBody(),
      ),
    );
  }
}
