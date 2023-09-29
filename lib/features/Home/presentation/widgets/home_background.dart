import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';

class HomeBackground extends StatelessWidget {
  final Widget child;

  const HomeBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: size.height * .232,
            right: size.width * -0.020,
            child: Opacity(
              opacity: 0.21,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black,
                offset: const Offset(0, 4),
                sigma: 4,
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
          //The cloud Center screen
          Positioned(
            top: size.height * .135,
            left: -35,
            child: Opacity(
              opacity: 0.08,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black,
                offset: const Offset(0, 2),
                sigma: 4,
                child: SizedBox(
                  height: 55,
                  width: 107,
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
