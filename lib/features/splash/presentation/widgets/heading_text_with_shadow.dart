import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/styles.dart';

class HeadingTextWithShadow extends StatelessWidget {
  const HeadingTextWithShadow({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: Align(
        alignment: Alignment.centerRight,
        child: SimpleShadow(
          opacity: 0.25,
          color: Colors.black, // Default: Black
          offset: const Offset(-1, 5), // Default: Offset(2, 2)
          sigma: 2,
          child: Text(
            title,
            style: Styles.textStyle32,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
