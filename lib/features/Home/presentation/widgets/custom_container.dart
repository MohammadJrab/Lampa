import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/styles.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.title,
      this.textStyle,
      this.sharpColor,
      required this.height,
      required this.width});
  final String title;
  final TextStyle? textStyle;
  final Color? sharpColor;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.15,
      color: Colors.black,
      offset: const Offset(0, 4),
      sigma: 2,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle ??
                  Styles.textStyle11.copyWith(
                    color: const Color(0xff222222),
                  ),
            ),
            const SizedBox(width: 6),
            Text(
              "#",
              style: textStyle ??
                  Styles.textStyle11.copyWith(
                    color: sharpColor ?? const Color(0xff5B5B5B),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
