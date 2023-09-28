import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamba/utils/styles.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';
import 'custom_radio_button.dart';
import 'custom_text_botton.dart';
import 'forget_passord_background.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  int selectedRadio = 1;
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
                      right: 27,
                    ),
                    child: SvgPicture.asset(
                      AssetsData.forgetPasswordMan,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'نسيت كلمة المرور',
                    style: Styles.textStyle24,
                  ),
                )
              ],
            ),
          ),
          SimpleShadow(
            opacity: .25,
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
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(60),
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
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "حدد تفاصيل الاتصال التي يجب أن نستخدمها لحفظ كلمة المرور الخاصة بك",
                          style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: const Color(0xff4C4C4C),
                              fontWeight: FontWeight.w400),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRadio = 1;
                          });
                        },
                        child: CustomRadioButton(
                          title: "ايميل",
                          subtitle: "ارسال الى الايميل",
                          isSelected: selectedRadio == 1,
                          icon: AssetsData.emailContainer,
                          iconPart2: AssetsData.emailArrow,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRadio = 2;
                          });
                        },
                        child: CustomRadioButton(
                          title: "رقم الهاتف",
                          subtitle: "ارسال الى رقم الهاتف",
                          isSelected: selectedRadio == 2,
                          icon: AssetsData.emailContainer,
                          iconPart2: AssetsData.emailArrow,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      CustomTextButton(
                        color: const Color(0xff3E6897),
                        title: "استمرار",
                        onTap: () {},
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
