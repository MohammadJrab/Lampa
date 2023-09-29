import 'package:flutter/material.dart';
import 'package:lamba/utils/assets.dart';
import 'package:simple_shadow/simple_shadow.dart';

class CustomTabContainer extends StatelessWidget {
  const CustomTabContainer({
    super.key,
    required this.title,
    this.textStyle,
    required this.height,
    required this.width,
    required this.font,
  });
  final String title;
  final TextStyle? textStyle;
  final double height;
  final double width;
  final TextStyle font;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.15,
      color: Colors.black,
      offset: const Offset(0, 4),
      sigma: 2,
      child: Container(
        height: height,
        // padding: isSelected ? const EdgeInsets.only(left: 30, right: 8) : null,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: const DecorationImage(
              image: AssetImage(AssetsData.backgrounLight),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: font,
            ),
          ],
        ),
      ),
    );
  }
}
