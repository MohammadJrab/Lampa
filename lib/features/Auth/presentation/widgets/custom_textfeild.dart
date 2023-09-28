import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool isObscureText;
  final String firstPartIcon;
  final String secondPartIcon;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isObscureText = false,
    required this.firstPartIcon,
    required this.secondPartIcon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              textAlign: TextAlign.right,
              textInputAction: TextInputAction.next,
              textDirection: TextDirection.ltr,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              style:
                  Styles.textStyle12.copyWith(color: const Color(0xff222222)),
              decoration: InputDecoration(
                  hintText: widget.hint,
                  contentPadding:
                      const EdgeInsets.only(bottom: 8.0, right: 5.0, left: 5.0),
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: Styles.textStyle12.copyWith(
                    color: kTextBlackColor,
                  ),
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none),
              obscuringCharacter: "*",
              obscureText: widget.isObscureText,
            ),
          ),
          const SizedBox(width: 15),
          Container(
            color: const Color(0xffD3D3D3),
            height: 30,
            width: 1.2,
          ),
          const SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              SvgPicture.asset(widget.firstPartIcon),
              Positioned(
                  top: 2,
                  left: 2,
                  child: SvgPicture.asset(widget.secondPartIcon)),
            ],
          )
        ],
      ),
    );
  }
}
