import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_shadow/simple_shadow.dart';

class OptTextField extends StatelessWidget {
  const OptTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      this.onChanged});
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: SimpleShadow(
        opacity: 0.15,
        color: Colors.black,
        offset: const Offset(0, 2),
        sigma: 4,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          // maxLength: 1,
          focusNode: focusNode,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Color(0xff000000),
          ),
          cursorColor: Colors.black,
          cursorWidth: 1.5,
          cursorHeight: 31,
          decoration: const InputDecoration(
            focusColor: Color(0xff5E90C9),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                color: Color(0xff5E90C9),
                width: 1.5,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(top: 12.0, bottom: 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
