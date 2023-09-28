import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/styles.dart';

class CustomSelectUserButton extends StatefulWidget {
  final bool isSelected;
  final String title;
  final String subtitle;
  final String? icon;
  final Color? color;
  const CustomSelectUserButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    this.icon = "",
    this.color,
  });

  @override
  State<CustomSelectUserButton> createState() => _CustomSelectUserButtonState();
}

class _CustomSelectUserButtonState extends State<CustomSelectUserButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SimpleShadow(
              opacity: 0.15,
              color: Colors.black,
              offset: const Offset(0, 2),
              sigma: 4,
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              widget.title,
                              style: Styles.textStyle13,
                            ),
                            Text(
                              widget.subtitle,
                              style: Styles.textStyle10.copyWith(
                                color: const Color(0xff4F4E4E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      Container(
                        color: const Color(0xffD3D3D3),
                        height: 30,
                        width: 1.2,
                      ),
                      const SizedBox(width: 11),
                      SimpleShadow(
                        opacity: 0.1,
                        color: Colors.black,
                        offset: const Offset(0, 0),
                        sigma: 2,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          width: 47.0,
                          height: 47.0,
                          decoration: BoxDecoration(
                            color: widget.color ?? Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: widget.icon!.isNotEmpty
                              ? SvgPicture.asset(widget.icon!)
                              : Text(
                                  widget.title.substring(0, 1),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: Styles.textStyle18.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
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
