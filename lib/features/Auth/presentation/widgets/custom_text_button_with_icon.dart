import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';

class CustomTextButtonWithIcon extends StatelessWidget {
  const CustomTextButtonWithIcon({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 29, top: 15),
      child: TextButton(
        onPressed: onTap,
        style: const ButtonStyle(
          alignment: Alignment.centerLeft,
        ),
        child: SizedBox(
          height: 24,
          width: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "تخطي",
                style: Styles.textStyle14,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(width: 5),
              const Opacity(
                opacity: 0.7,
                child: Icon(
                  Icons.error_outline,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
