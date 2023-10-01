import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamba/utils/app_router.dart';
import 'constants.dart';

void main() => runApp(const Lamba());

class Lamba extends StatelessWidget {
  const Lamba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lamba',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimitiveColor,
          textTheme: GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme)),
      routerConfig: AppRouter.router,
      // routerDelegate: AppRouter.router.routerDelegate,
      // routeInformationParser: AppRouter.router.routeInformationParser,
    );
  }
}
