import 'package:flutter/material.dart';
import '../../../../utils/widgets/custom_botton_navigation_bar.dart';
import '../widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: HomeBody(),
          bottomNavigationBar: CustomBottonNavigationBar(),
        ),
      ),
    );
  }
}
