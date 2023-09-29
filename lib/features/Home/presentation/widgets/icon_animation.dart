import 'package:flutter/material.dart';

class IconAnimation extends StatelessWidget {
  const IconAnimation(
      {Key? key,
      required this.isExpanded,
      required this.onTap,
      required this.animation,
      required this.angle})
      : super(key: key);

  final bool isExpanded;
  final void Function() onTap;
  final AnimationController animation;
  final Animation<double> angle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.transparent,
        width: 50.0,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SizedBox(
              width: isExpanded ? 20.0 : 35.0,
              height: isExpanded ? 20.0 : 18.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: isExpanded ? null : 0,
                    right: isExpanded ? null : 0,
                    child: Transform.rotate(
                      alignment:
                          isExpanded ? Alignment.center : Alignment.centerRight,
                      angle: -angle.value * 1.4871435,
                      origin: const Offset(0.0, 0.0),
                      child: Container(
                        color: Colors.white,
                        width: isExpanded ? 19.43 : 33,
                        height: 2.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: isExpanded ? null : 8,
                    right: isExpanded ? null : 0,
                    child: Transform.rotate(
                      alignment:
                          isExpanded ? Alignment.center : Alignment.centerRight,
                      angle: angle.value * 1.4871435,
                      origin: const Offset(0.0, 0.0),
                      child: Container(
                        color: Colors.white,
                        width: isExpanded ? 19.43 : 25,
                        height: 2.0,
                      ),
                    ),
                  ),
                  // if (!isExpanded)
                  Positioned(
                    top: 16,
                    right: 0,
                    child: AnimatedOpacity(
                      opacity: isExpanded ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linearToEaseOut,
                      child: Container(
                        color: Colors.white,
                        width: 17,
                        height: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
