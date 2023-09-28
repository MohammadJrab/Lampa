import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
    this.textStyle,
  });
  final String image;
  final String title;
  final TextStyle? textStyle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SimpleShadow(
        opacity: 0.15,
        color: Colors.black,
        offset: const Offset(0, 4),
        sigma: 2,
        child: Container(
          height: 44,
          width: 116,
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
                    const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 6),
              Image.asset(
                image,
              )
            ],
          ),
        ),
      ),
    );
  }
}
