import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/styles.dart';

class Subheader extends StatelessWidget {
  const Subheader({
    super.key,
    required this.subheader,
  });
  final String subheader;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(right: 28),
        child: Align(
          alignment: Alignment.centerRight,
          child: SimpleShadow(
            opacity: 0.25,
            color: Colors.black, // Default: Black
            offset: const Offset(0, 5), // Default: Offset(2, 2)
            sigma: 2,
            child: Text(
              subheader,
              style: Styles.textStyle18,
              maxLines: 4,
              textAlign: TextAlign.right,
              overflow: TextOverflow.clip,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
  }
}
