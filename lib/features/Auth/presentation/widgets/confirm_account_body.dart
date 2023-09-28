import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamba/features/Auth/presentation/widgets/forget_passord_background.dart';
import 'package:lamba/utils/app_router.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/styles.dart';
import 'custom_text_botton.dart';
import 'otp_text_field.dart';

class ConfirmAccountBody extends StatefulWidget {
  const ConfirmAccountBody({super.key});

  @override
  State<ConfirmAccountBody> createState() => _ConfirmAccountBodyState();
}

class _ConfirmAccountBodyState extends State<ConfirmAccountBody> {
  final FocusNode _digit1FocusNode = FocusNode();
  final FocusNode _digit2FocusNode = FocusNode();
  final FocusNode _digit3FocusNode = FocusNode();
  final FocusNode _digit4FocusNode = FocusNode();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _digit1FocusNode.dispose();
    _digit2FocusNode.dispose();
    _digit3FocusNode.dispose();
    _digit4FocusNode.dispose();
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

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
                      right: 3,
                    ),
                    child: SvgPicture.asset(
                      AssetsData.confirmAccount,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    'تأكيد الحساب',
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
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "من فضلك ادخل الرمز الدي ارسلناه للتو للايميل",
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
                      Text(
                        "abcdxxx@gmail.com",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.nunito(
                            fontSize: 18,
                            color: const Color(0xff4C4C4C),
                            fontWeight: FontWeight.w600),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(
                        height: 57,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OptTextField(
                            controller: _controller1,
                            focusNode: _digit1FocusNode,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                fieldFocusChange(context, _digit1FocusNode,
                                    _digit2FocusNode);
                              }
                            },
                          ),
                          OptTextField(
                            controller: _controller2,
                            focusNode: _digit2FocusNode,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                fieldFocusChange(context, _digit2FocusNode,
                                    _digit3FocusNode);
                              }
                            },
                          ),
                          OptTextField(
                            controller: _controller3,
                            focusNode: _digit3FocusNode,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                fieldFocusChange(context, _digit3FocusNode,
                                    _digit4FocusNode);
                              }
                            },
                          ),
                          OptTextField(
                            controller: _controller4,
                            focusNode: _digit4FocusNode,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "إعادة إرسال",
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff5E90C9),
                              ),
                            ),
                          ),
                          const Text(
                            "لم تتلقى أي رسالة؟",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4C4C4C),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 63,
                      ),
                      CustomTextButton(
                        color: const Color(0xff3E6897),
                        title: "استمرار",
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kCongratsView);
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
