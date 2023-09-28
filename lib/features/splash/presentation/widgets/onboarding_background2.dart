import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';

class OnboardingBackground2 extends StatelessWidget {
  final Widget child;
  const OnboardingBackground2({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: const Color(0xffEE7BB7),
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
                offset: const Offset(0, 5), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 117,
                  width: 174,
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
            top: size.height * .09,
            right: 25,
            child: Opacity(
              opacity: 1,
              child: SimpleShadow(
                opacity: 0.2,
                color: Colors.black, // Default: Black
                offset: const Offset(-1, 5), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 56,
                  width: 87,
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
            top: size.height * .48,
            right: -10,
            child: Opacity(
              opacity: 0.44,
              child: SimpleShadow(
                opacity: 0.25,
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
            top: size.height * .66,
            left: -25,
            child: Opacity(
              opacity: 0.22,
              child: SimpleShadow(
                opacity: 0.5,
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
            bottom: size.height * .13,
            left: size.width * .41,
            child: Opacity(
              opacity: 0.33,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black, // Default: Black
                offset: const Offset(0, 4), // Default: Offset(2, 2)
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
