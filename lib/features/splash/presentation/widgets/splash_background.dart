import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';

class SplashBackground extends StatelessWidget {
  final Widget child;
  const SplashBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: -45,
            child: Opacity(
              opacity: 0.5,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black, // Default: Black
                offset: const Offset(-1, 5), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 138,
                  width: 206,
                  child: SvgPicture.asset(
                    fit: BoxFit.fill,
                    AssetsData.cloudR,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * .1,
            left: 40,
            child: Opacity(
              opacity: 1,
              child: SimpleShadow(
                opacity: 0.2,
                color: Colors.black, // Default: Black
                offset: const Offset(-1, 5), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 65,
                  width: 103,
                  child: SvgPicture.asset(
                    fit: BoxFit.fill,
                    AssetsData.cloud,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.17,
            right: 12,
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
                    fit: BoxFit.fill,
                    AssetsData.cloudR,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * .4,
            right: -35,
            child: Opacity(
              opacity: 0.3,
              child: SimpleShadow(
                opacity: 0.7,
                color: Colors.black, // Default: Black
                offset: const Offset(-1, 5), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 63,
                  width: 122,
                  child: SvgPicture.asset(
                    AssetsData.cloudR,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * .5,
            left: -25,
            child: Opacity(
              opacity: 0.3,
              child: SimpleShadow(
                opacity: 0.5,
                color: Colors.black, // Default: Black
                offset: const Offset(2, 4), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 55,
                  width: 112,
                  child: SvgPicture.asset(
                    fit: BoxFit.fill,
                    AssetsData.cloudR,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * .2,
            left: 33,
            child: Opacity(
              opacity: 0.66,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black, // Default: Black
                offset: const Offset(0, 4), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 41,
                  width: 70,
                  child: SvgPicture.asset(
                    fit: BoxFit.fill,
                    AssetsData.cloudR,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: -35,
            child: Opacity(
              opacity: 0.33,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black, // Default: Black
                offset: const Offset(0, 4), // Default: Offset(2, 2)
                sigma: 2,
                child: SizedBox(
                  height: 114,
                  width: 188,
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
