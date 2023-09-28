import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/styles.dart';

class CustomRadioButton extends StatefulWidget {
  final bool isSelected;

  final String title;
  final String subtitle;
  final String icon;
  final String? iconPart2;

  const CustomRadioButton({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconPart2,
  }) : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              width: 320,
              height: 78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: const Color(0xffFEFEFD),
                border: widget.isSelected == true
                    ? Border.all(color: const Color(0xff3E6897), width: 2.0)
                    : null,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.title,
                          style: Styles.textStyle15,
                        ),
                        Text(
                          widget.subtitle,
                          style: Styles.textStyle12.copyWith(
                            color: const Color(0xff4F4E4E),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 13),
                    SimpleShadow(
                      opacity: 0.1,
                      color: Colors.black,
                      offset: const Offset(0, 0),
                      sigma: 2,
                      child: Container(
                        alignment: Alignment.center,
                        width: 47.0,
                        height: 47.0,
                        decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            SvgPicture.asset(AssetsData.emailContainer),
                            Positioned(
                              top: 2,
                              left: 2,
                              child: SvgPicture.asset(
                                  widget.iconPart2 ?? AssetsData.transparent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(top: 2, left: 20),
                child: widget.isSelected == true
                    ? SvgPicture.asset(AssetsData.checkIcon)
                    : const SizedBox()),
          ),
        ],
      ),
    );
  }
}
