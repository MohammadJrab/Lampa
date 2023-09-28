import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lamba/features/Auth/presentation/widgets/custom_select_user_button.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/app_router.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/styles.dart';
import 'custom_button_with_icon.dart';
import 'custom_text_botton.dart';
import 'forget_passord_background.dart';

class SignWithGoogleBody extends StatelessWidget {
  const SignWithGoogleBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return ForgetPasswordBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 18,
                    ),
                    child: SvgPicture.asset(
                      AssetsData.containerGirl,
                      height: 97,
                      width: 49,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    'اختر الحساب',
                    style: Styles.textStyle24,
                  ),
                )
              ],
            ),
          ),
          SimpleShadow(
            opacity: .15,
            color: Colors.black,
            offset: const Offset(0, -6),
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
                      const SizedBox(height: 29),
                      SizedBox(
                        height: 35,
                        width: 85,
                        child: CustomButtonWithIcon(
                          image: AssetsData.google,
                          title: "غوغل",
                          textStyle: Styles.textStyle11,
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(height: 38.9),
                      const CustomSelectUserButton(
                        isSelected: false,
                        title: "محمد محمد",
                        subtitle: "Mhammad@gmail.com",
                        color: Color(0xffEE7B97),
                      ),
                      const SizedBox(height: 41),
                      const CustomSelectUserButton(
                        isSelected: false,
                        title: "أحمد محمد",
                        subtitle: "Mhammad@gmail.com",
                        color: Color(0xff6AAAF1),
                      ),
                      const SizedBox(
                        height: 41,
                      ),
                      CustomTextButton(
                        color: const Color(0xff3E6897),
                        title: "تسجيل الدخول",
                        onTap: () {
                          GoRouter.of(context)
                              .push(AppRouter.kPoliciesAndTermsView);
                        },
                      ),
                      const SizedBox(height: 43),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "يمكنك المتابعة والتعليق بحساب غوغل",
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff4C4C4C),
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
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
