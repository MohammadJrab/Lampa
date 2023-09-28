import 'package:flutter/material.dart';

import '../widgets/congrats_body.dart';

class Congrats extends StatelessWidget {
  const Congrats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CongratsBody()),
    );
  }
}
