import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lamba/features/splash/presentation/widgets/subheader.dart';
import 'package:lamba/utils/app_router.dart';
import 'package:lamba/utils/assets.dart';
import 'package:lamba/utils/styles.dart';

import 'heading_text_with_shadow.dart';
import 'indicator.dart';
import 'onboarding_background1.dart';
import 'onboarding_background2.dart';
import 'onboarding_background3.dart';
import 'onboarding_image.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  int correntPage = 0;
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          children: [
            OnboardingBackground1(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: size.height * .26),
                  const HeadingTextWithShadow(
                    title: "الثقة والأمان",
                  ),
                  const SizedBox(height: 25),
                  const Subheader(
                      subheader:
                          "التمتع بأعلى درجات الثقة والأمان وجميع البيانات سرية ."),
                  const SizedBox(height: 57),
                  const OnBoardingImage(
                      positionedBottom: 18,
                      imageHeight: 164,
                      imageWidth: 249,
                      image: AssetsData.onboardin1P1),
                ],
              ),
            ),
            OnboardingBackground2(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: size.height * .24),
                  const OnBoardingImage(
                      positionedBottom: 2,
                      imageHeight: 198,
                      positionedTopLeft: 5,
                      imageWidth: 231,
                      image: AssetsData.onboardin2P2),
                  SizedBox(height: size.height * .05),
                  const HeadingTextWithShadow(
                    title: "العلاج السهل",
                  ),
                  const SizedBox(height: 25),
                  const Subheader(
                      subheader:
                          "علاج جميع الاضطرابات والمشكلات بدون أدوية نفسية باستثناء حالات نادرة تُحال إلى الطبيب"),
                  const SizedBox(height: 57)
                ],
              ),
            ),
            OnboardingBackground3(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: size.height * .24),
                  const HeadingTextWithShadow(
                    title: "معك حتى الشفاء",
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(
                    height: 150,
                    width: 350,
                    child: Subheader(
                        subheader:
                            "رحلة علاجك النفسي سوف تكون متكاملة من خلال المتابعة المجانية لمدة شهر بعد الانتهاء من الوقت المحدد للعلاج\n والتشافي"),
                  ),
                  SizedBox(height: size.height * .06),
                  const OnBoardingImage(
                      positionedBottom: 40,
                      positionedLeft: -25,
                      imageHeight: 146,
                      imageWidth: 230,
                      image: AssetsData.onboardin3P2),
                  const SizedBox(height: 57),
                ],
              ),
            ),
          ],
          onPageChanged: (int page) {
            setState(() {
              correntPage = page;
            });
          },
        ),
        Positioned(
          bottom: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kAuthView);
                  },
                  child: Text(
                    "تخطي",
                    style: Styles.textStyle14,
                  ),
                ),
              ),
              const SizedBox(width: 75),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: buildPageindicatorWidget(),
                  ),
                ),
              ),
              const SizedBox(width: 75),
              IconButton(
                splashRadius: 28,
                iconSize: 50,
                icon: const Icon(Icons.keyboard_arrow_right_outlined),
                onPressed: () {
                  if (correntPage == 2) {
                    GoRouter.of(context).push(AppRouter.kAuthView);
                  } else if (correntPage >= 0 && correntPage <= 2) {
                    pageController.animateToPage(correntPage + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCirc);
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  // build indicators
  List<Widget> buildPageindicatorWidget() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == correntPage
          ? const Indicator(isActive: true)
          : const Indicator(isActive: false));
    }
    return list;
  }
}
