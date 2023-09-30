import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamba/features/Home/presentation/widgets/custom_container.dart';
import 'package:lamba/utils/assets.dart';
import 'package:lamba/utils/styles.dart';

class ExplainMoreView extends StatelessWidget {
  const ExplainMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AssetsData.loginDecoration,
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 72,
              width: 340,
              child: Center(
                child: Text(
                  "يمكنك اختيار نمظ معين من المقالات التي تناسبك لتظهر لك في الصفحة الرئيسية وفي احدث المقالات التي تنشر ",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle15.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff363636),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "222 شخص يقراون عن هدا",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle13.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff747474),
                  ),
                ),
                const SizedBox(width: 5),
                CustomContainer(
                  width: 116,
                  height: 44,
                  title: "الحب",
                  textStyle: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff222222)),
                )
              ],
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "222 شخص يقراون عن هدا",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle13.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff747474),
                  ),
                ),
                const SizedBox(width: 5),
                CustomContainer(
                  width: 116,
                  height: 44,
                  title: "السفر",
                  textStyle: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff222222)),
                )
              ],
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "114 شخص يقراون عن هدا",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle13.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff747474),
                  ),
                ),
                const SizedBox(width: 5),
                CustomContainer(
                  width: 116,
                  height: 44,
                  title: "الاطفال",
                  textStyle: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff222222)),
                )
              ],
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "350 شخص يقراون عن هدا",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle13.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff747474),
                  ),
                ),
                const SizedBox(width: 10),
                CustomContainer(
                  width: 116,
                  height: 44,
                  title: "# العمر",
                  textStyle: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff222222)),
                )
              ],
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "900 شخص يقراون عن هدا",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle13.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff747474),
                  ),
                ),
                const SizedBox(width: 10),
                CustomContainer(
                  width: 116,
                  height: 44,
                  title: "# الانفصال",
                  textStyle: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff222222)),
                )
              ],
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "246 شخص يقراون عن هدا",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle13.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff747474),
                  ),
                ),
                const SizedBox(width: 10),
                CustomContainer(
                  width: 116,
                  height: 44,
                  title: "الشغف",
                  textStyle: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff222222)),
                )
              ],
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "866 شخص يقراون عن هدا",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle13.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff747474),
                  ),
                ),
                const SizedBox(width: 10),
                CustomContainer(
                  width: 116,
                  height: 44,
                  title: "الضعف",
                  textStyle: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff222222)),
                )
              ],
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1450 شخص يقراون عن هدا",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle13.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: const Color(0xff747474),
                  ),
                ),
                const SizedBox(width: 10),
                CustomContainer(
                  width: 116,
                  height: 44,
                  title: "القوة",
                  textStyle: Styles.textStyle15.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff222222)),
                )
              ],
            ),
            const SizedBox(height: 26),
          ],
        ),
      ),
    );
  }
}
