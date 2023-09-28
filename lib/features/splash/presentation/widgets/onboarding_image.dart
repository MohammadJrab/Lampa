import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage(
      {super.key,
      required this.image,
      required this.imageHeight,
      required this.imageWidth,
      required this.positionedBottom,
      this.positionedTopLeft,
      this.positionedLeft});
  final String image;
  final double imageHeight;
  final double imageWidth;
  final double positionedBottom;
  final double? positionedLeft;
  final double? positionedTopLeft;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 200,
        width: 302,
        child: Stack(
          children: [
            Positioned(
              bottom: positionedBottom,
              left: positionedLeft ?? 0,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black,
                offset: const Offset(0, 2),
                sigma: 4,
                child: SvgPicture.asset(
                  AssetsData.onboardin1P2,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: positionedTopLeft ?? 25,
              child: SimpleShadow(
                opacity: 0.25,
                color: Colors.black,
                offset: const Offset(0, 2),
                sigma: 4,
                child: SvgPicture.asset(
                  image,
                  alignment: Alignment.center,
                  width: imageWidth,
                  height: imageHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
