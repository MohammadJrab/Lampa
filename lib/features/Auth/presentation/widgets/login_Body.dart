import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lamba/utils/app_router.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../constants.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/styles.dart';
import 'custom_button_with_icon.dart';
import 'custom_text_botton.dart';
import 'custom_textfeild.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.1,
      color: Colors.black,
      offset: const Offset(0, -15),
      sigma: 5,
      child: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AssetsData.loginDecoration,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(60))),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 25),
                Text(
                  "البريد الالكتروني",
                  style: Styles.textStyle14.copyWith(color: kTextColor),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  hint: "أدخل البريد الإلكتروني",
                  controller: emailController,
                  firstPartIcon: AssetsData.emailContainer,
                  secondPartIcon: AssetsData.emailArrow,
                ),
                const SizedBox(height: 25),
                Text(
                  "كلمة المرور",
                  style: Styles.textStyle14.copyWith(color: kTextColor),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  hint: "أدخل كلمة المرور",
                  controller: passwordController,
                  firstPartIcon: AssetsData.password,
                  secondPartIcon: AssetsData.transparent,
                  isObscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .push(AppRouter.kForgetPasswordView);
                      },
                      child: Text(
                        "نسيت كلمة المرور؟",
                        style: Styles.textStyle12.copyWith(color: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "تذكرني",
                          style:
                              Styles.textStyle12.copyWith(color: Colors.black),
                        ),
                        Transform.scale(
                          origin: Offset.zero,
                          alignment: Alignment.centerLeft,
                          scaleX: 0.9,
                          scaleY: 0.7,
                          child: Checkbox(
                            visualDensity: const VisualDensity(
                                horizontal: -4.0, vertical: -4.0),
                            splashRadius: 0,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(4)),
                            value: isChecked,
                            activeColor: const Color(0xff5E90C9),
                            onChanged: (newBool) => setState(() {
                              isChecked = newBool!;
                            }),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                CustomTextButton(
                  color: const Color(0xff3E6897),
                  title: "تسجيل الدخول",
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kHomeView);
                  },
                ),
                const SizedBox(height: 22),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'أو سجل عن طريق',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4D4D4D),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonWithIcon(
                      title: "غوغل",
                      image: AssetsData.google,
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kSignWithGoogleView);
                      },
                    ),
                    const SizedBox(width: 17),
                    CustomButtonWithIcon(
                      title: "فيسبوك",
                      image: AssetsData.facebook,
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kSignWithGoogleView);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 35)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
