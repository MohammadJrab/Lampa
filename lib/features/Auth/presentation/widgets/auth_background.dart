import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

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
            top: 1,
            right: -25,
            child: Opacity(
              opacity: 0.5,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black,
                offset: const Offset(-1, 5),
                sigma: 2,
                child: SizedBox(
                  height: 51,
                  width: 79,
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
            top: size.height * .04,
            right: 15,
            child: Opacity(
              opacity: 1,
              child: SimpleShadow(
                opacity: 0.2,
                color: Colors.black,
                offset: const Offset(-1, 5),
                sigma: 2,
                child: SizedBox(
                  height: 25,
                  width: 38,
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
            top: size.height * .14,
            left: -50,
            child: Opacity(
              opacity: 0.1,
              child: SimpleShadow(
                opacity: 0.8,
                color: Colors.black,
                offset: const Offset(2, 4),
                sigma: 2,
                child: SizedBox(
                  height: 55,
                  width: 116,
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
            right: 10,
            child: Opacity(
              opacity: 0.3,
              child: SimpleShadow(
                opacity: 0.7,
                color: Colors.black,
                offset: const Offset(-1, 5),
                sigma: 2,
                child: SizedBox(
                  height: 63,
                  width: 94,
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
            left: 50,
            child: Opacity(
              opacity: 0.33,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black,
                offset: const Offset(0, 4),
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
