import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/styles.dart';

class SearchTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final String searchIcon;
  final String filterIcon;
  final double width;

  const SearchTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.searchIcon,
    required this.filterIcon,
    required this.width,
  });

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.filterIcon),
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
                  contentPadding: const EdgeInsets.only(
                      bottom: 10.0, right: 5.0, left: 5.0),
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: Styles.textStyle12.copyWith(
                    color: const Color(0xff292929).withOpacity(0.74),
                  ),
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          const SizedBox(width: 15),
          SvgPicture.asset(widget.searchIcon),
        ],
      ),
    );
  }
}
