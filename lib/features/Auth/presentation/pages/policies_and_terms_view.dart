import 'package:flutter/material.dart';
import 'package:lamba/features/Auth/presentation/widgets/policies_and_terms_body.dart';

class PoliciesAndTermsView extends StatelessWidget {
  const PoliciesAndTermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        floatingActionButton: null,
        body: PoliciesAndTermsBody(),
      ),
    );
  }
}
