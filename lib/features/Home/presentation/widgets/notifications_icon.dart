import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/assets.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
    required this.count,
  });
  final String count;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 25,
      child: Stack(
        children: [
          SvgPicture.asset(AssetsData.notificationsIcon, fit: BoxFit.cover),
          Positioned(
            right: 0,
            child: Container(
              height: 10,
              width: 9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Text(
                count,
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontSize: 5.5,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff3E6897),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
