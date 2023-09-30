import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lamba/utils/app_router.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/styles.dart';
import 'custom_text_botton.dart';
import 'forget_passord_background.dart';

class CongratsBody extends StatelessWidget {
  const CongratsBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ForgetPasswordBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SimpleShadow(
            opacity: .10,
            color: Colors.black,
            offset: const Offset(0, -4),
            sigma: 4,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssetsData.backgrounLight,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "تهانينا....يمكنك الان التصفح بسهولة اكبر وحفظ المقالات والتعليق عليها",
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff4C4C4C),
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      SvgPicture.asset(AssetsData.congratsPicture),
                      const SizedBox(
                        height: 57,
                      ),
                      SizedBox(height: size.height * 0.06),
                      CustomTextButton(
                        color: const Color(0xff3E6897),
                        title: "استمرار",
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kHomeView);
                        },
                      ),
                      SizedBox(height: size.height * 0.09),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
