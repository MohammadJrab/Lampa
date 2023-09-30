import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lamba/features/Auth/presentation/widgets/login_Body.dart';
import 'package:lamba/features/Auth/presentation/widgets/signup_body.dart';
import 'package:lamba/utils/app_router.dart';
import 'package:lamba/utils/assets.dart';
import 'package:lamba/utils/styles.dart';
import 'auth_background.dart';
import 'custom_text_button_with_icon.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({super.key});

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 2000),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AuthBackground(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextButtonWithIcon(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kHomeView);
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        TabBar(
                          isScrollable: false,
                          controller: _tabController,
                          unselectedLabelStyle: Styles.textStyle16,
                          labelStyle: Styles.textStyle24,
                          labelPadding: const EdgeInsets.only(bottom: 20),
                          indicator: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AssetsData.tabBarIndicator),
                              fit: BoxFit.none,
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                          tabs: const [
                            Tab(
                              text: 'انشاء حساب',
                            ),
                            Tab(
                              text: 'تسجيل الدخول',
                            ),
                            // Add more tabs as needed
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: SvgPicture.asset(
                            AssetsData.containerGirl,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    key: const Key("TabBarView"),
                    child: SizedBox(
                      width: double.infinity,
                      child: TabBarView(
                        controller: _tabController,
                        // physics: const BouncingScrollPhysics(),
                        children: const [
                          SignInBody(),
                          LoginBody(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
