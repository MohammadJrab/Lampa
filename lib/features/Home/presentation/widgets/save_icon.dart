import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamba/utils/assets.dart';

class SaveIcon extends StatelessWidget {
  const SaveIcon(
      {super.key,
      required this.onTap,
      required this.isSaved,
      this.height,
      this.width,
      this.color});
  final void Function() onTap;
  final bool isSaved;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height ?? 19,
        width: width ?? 15,
        child: isSaved
            ? SvgPicture.asset(
                AssetsData.saveAcive, fit: BoxFit.cover,
                // height: height ?? 19,
                // width: width ?? 15,
                // fit: BoxFit.fill,
              )
            : SvgPicture.asset(
                AssetsData.save,
                // height: height ?? 19,
                // width: width ?? 15,
                color: color ?? const Color(0xff626262), fit: BoxFit.cover,
                // fit: BoxFit.cover,
              ),
      ),
    );
  }
}
