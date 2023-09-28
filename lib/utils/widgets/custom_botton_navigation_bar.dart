import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../assets.dart';

class CustomBottonNavigationBar extends StatefulWidget {
  const CustomBottonNavigationBar({super.key});

  @override
  State<CustomBottonNavigationBar> createState() =>
      _CustomBottonNavigationBarState();
}

class _CustomBottonNavigationBarState extends State<CustomBottonNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AssetsData.loginDecoration,
            ),
            fit: BoxFit.cover),
      ),
      child: Container(
        // margin: EdgeInsets.all(displayWidth * .05),
        // height: displayWidth * .155,
        height: 75, width: displayWidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.11),
              blurRadius: 11,
              offset: const Offset(0, -2),
            ),
          ],
          image: const DecorationImage(
              image: AssetImage(
                AssetsData.loginDecoration,
              ),
              fit: BoxFit.cover),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .32
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? displayWidth * .12 : 0,
                      width: index == currentIndex ? displayWidth * .32 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.blueAccent.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(39),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .31
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * .13
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == currentIndex
                                    ? listOfStrings[index]
                                    : '',
                                style: const TextStyle(
                                  color: Color(0xff3E6897),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 9,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * .04
                                  : 20,
                            ),
                            Image.asset(
                              index == currentIndex
                                  ? listOfAciveIcons[index]
                                  : listOfIcons[index],
                              width: displayWidth * .076,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> listOfIcons = [
    AssetsData.homeIcon,
    AssetsData.articles,
    AssetsData.search,
    AssetsData.whoWeAre,
  ];
  List<String> listOfAciveIcons = [
    AssetsData.homeActiveIcon,
    AssetsData.articlesActive,
    AssetsData.searchActive,
    AssetsData.whoWeAreActive,
  ];

  List<String> listOfStrings = [
    'الصفحة الرئيسية',
    'المقالات',
    'قائمة البحث',
    'من نحن؟',
  ];
  // List<void> listOfFuction = [
  //   (context) {
  //     GoRouter.of(context).push(AppRouter.kHomeView);
  //   },
  //   (context) {
  //     GoRouter.of(context).push(AppRouter.kHomeView);
  //   },
  //   (context) {
  //     GoRouter.of(context).push(AppRouter.kPoliciesAndTermsView);
  //   },
  //   (context) {
  //     GoRouter.of(context).push(AppRouter.kHomeView);
  //   },
  // ];
}
