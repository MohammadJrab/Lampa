import 'package:flutter/material.dart';
import 'package:lamba/utils/styles.dart';
import 'package:simple_shadow/simple_shadow.dart';

class VideoContainer extends StatelessWidget {
  const VideoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      color: Colors.black,
      offset: const Offset(0, 2),
      opacity: 0.15,
      sigma: 4,
      child: Container(
        height: 168,
        width: 314,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffFFFFFF),
        ),
        child: Center(
          child: Text(
            "فيديو تعليمي او اعلان ترويجي",
            textAlign: TextAlign.center,
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xff757575),
            ),
          ),
        ),
      ),
    );
  }
}
