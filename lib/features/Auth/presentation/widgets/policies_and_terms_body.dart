import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../constants.dart';
import '../../../../utils/app_router.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/styles.dart';
import 'custom_text_botton.dart';
import 'forget_passord_background.dart';

class PoliciesAndTermsBody extends StatefulWidget {
  const PoliciesAndTermsBody({Key? key}) : super(key: key);

  @override
  State<PoliciesAndTermsBody> createState() => _PoliciesAndTermsBodyState();
}

class _PoliciesAndTermsBodyState extends State<PoliciesAndTermsBody> {
  late ScrollController _scrollController;
  bool showButton = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // scrollCon.addListener(_scrollController);
  }

  @override
  void dispose() {
    // scrollCon.removeListener(_scrollController);
    _scrollController.dispose();

    super.dispose();
  }

  // void scrollListener() {
  //   if (_scrollController.position.pixels >=
  //       _scrollController.position.maxScrollExtent) {
  //     setState(() {
  //       showButton = false;
  //     });
  //   } else {
  //     setState(() {
  //       showButton = true;
  //     });
  //   }
  // }

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "السياسات والشروط",
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
              height: size.height * 0.76,
              width: double.infinity,
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
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        left: 28, right: 28, top: 65, bottom: 5),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(height: 62),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          child: Text(
                            arabicString,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "غير موافق",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff000000)
                                          .withOpacity(0.68),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 217,
                              height: 44,
                              child: CustomTextButton(
                                color: const Color(0xff3E6897),
                                title: "أوافق على الشروط",
                                onTap: () {
                                  GoRouter.of(context)
                                      .push(AppRouter.kHomeView);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.05),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showButton,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 21),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SimpleShadow(
                          opacity: 0.25,
                          color: Colors.black,
                          offset: const Offset(0, 1),
                          sigma: 3,
                          child: FloatingActionButton(
                            heroTag: null,
                            onPressed: _scrollToEnd,
                            backgroundColor: Colors.white,
                            child: const Icon(
                              Icons.expand_more,
                              size: 38,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
