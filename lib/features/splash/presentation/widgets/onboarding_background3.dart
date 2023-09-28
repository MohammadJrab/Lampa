import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';

class OnboardingBackground3 extends StatelessWidget {
  final Widget child;
  const OnboardingBackground3({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          //The cloud at the top of the screen
          Positioned(
            top: 0,
            right: -45,
            child: Opacity(
              opacity: 0.5,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black, // Default: Black
                offset: const Offset(-1, 5), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 131,
                  width: 198,
                  child: SvgPicture.asset(
                    fit: BoxFit.fill,
                    AssetsData.cloudR,
                  ),
                ),
              ),
            ),
          ),
          //The cloud at Under top of the screen
          Positioned(
            top: size.height * .1,
            right: 40,
            child: Opacity(
              opacity: 1,
              child: SimpleShadow(
                opacity: 0.2,
                color: Colors.black, // Default: Black
                offset: const Offset(-1, 5), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 62,
                  width: 96,
                  child: SvgPicture.asset(
                    fit: BoxFit.fill,
                    AssetsData.cloudR,
                  ),
                ),
              ),
            ),
          ),
          //The cloud Center screen
          Positioned(
            top: size.height * .5,
            left: -22,
            child: Opacity(
              opacity: 0.1,
              child: SimpleShadow(
                opacity: 0.8,
                color: Colors.black, // Default: Black
                offset: const Offset(2, 4), // Default: Offset(2, 2)
                sigma: 1,
                child: SizedBox(
                  height: 47,
                  width: 106,
                  child: SvgPicture.asset(
                    fit: BoxFit.fill,
                    AssetsData.cloudR,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * .52,
            right: -10,
            child: Opacity(
              opacity: 0.3,
              child: SimpleShadow(
                opacity: 0.4,
                color: Colors.black, // Default: Black
                offset: const Offset(-1, 5), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 41,
                  width: 70,
                  child: SvgPicture.asset(
                    AssetsData.cloudR,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          //The cloud bottom of the screen

          Positioned(
            bottom: size.height * .1,
            right: 50,
            child: Opacity(
              opacity: 0.33,
              child: SimpleShadow(
                opacity: 0.44,
                color: Colors.black, // Default: Black
                offset: const Offset(2, 4), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 47,
                  width: 78,
                  child: SvgPicture.asset(
                    fit: BoxFit.fill,
                    AssetsData.cloudR,
                  ),
                ),
              ),
            ),
          ),

          child,
        ],
      ),
    );
  }
}
