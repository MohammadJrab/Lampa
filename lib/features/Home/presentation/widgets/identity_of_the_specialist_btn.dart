import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamba/utils/assets.dart';

class IdentityOfTheSpecialistButton extends StatelessWidget {
  final void Function() onTap;
  final bool? withoutIcon;

  const IdentityOfTheSpecialistButton({
    super.key,
    required this.onTap,
    this.withoutIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 75,
        height: 15,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Row(
                children: [
                  Text(
                    "هوية الأخصائية؟",
                    style: GoogleFonts.cairo(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff3E6897)),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  SvgPicture.asset(
                    AssetsData.idIcon,
                    width: 11,
                    height: 8.56,
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 0,
              child: SizedBox(
                width: 74,
                height: 2,
                child: Divider(
                  thickness: 1,
                  color: Color(0xff3E6897),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContanctWithUSButton extends StatelessWidget {
  final void Function() onTap;
  const ContanctWithUSButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 75,
        height: 15,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Row(
                children: [
                  Text(
                    "تواصل معنا",
                    style: GoogleFonts.cairo(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff3E6897)),
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 0,
              child: SizedBox(
                width: 43,
                height: 2,
                child: Divider(
                  thickness: 1,
                  color: Color(0xff3E6897),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
