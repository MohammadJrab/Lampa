import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamba/utils/assets.dart';

class SaveIcon extends StatelessWidget {
  const SaveIcon({super.key, required this.onTap, required this.isSaved});
  final void Function() onTap;
  final bool isSaved;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: isSaved
          ? SvgPicture.asset(
              AssetsData.saveAcive,
              height: 19,
              width: 15,
            )
          : SvgPicture.asset(
              AssetsData.save,
              height: 19,
              width: 15,
              color: const Color(0xff626262),
            ),
    );
  }
}
