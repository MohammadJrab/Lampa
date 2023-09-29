import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamba/features/Home/presentation/widgets/custom_container.dart';
import 'package:lamba/utils/styles.dart';

import '../../../../utils/assets.dart';
import 'save_icon.dart';

class ForYouItem extends StatelessWidget {
  const ForYouItem(
      {super.key,
      required this.title,
      required this.part,
      required this.publisher,
      required this.subtitle,
      required this.isSaved,
      required this.toggleIsSavedState,
      required this.date,
      required this.image,
      required this.imageWithOpacity});
  final String title;
  final String part;
  final String image;
  final String publisher;
  final String subtitle;
  final String imageWithOpacity;
  final String date;
  final bool isSaved;
  final void Function() toggleIsSavedState;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> linesList = subtitle.split('\n');
    String lastLine = linesList.last;
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

      // padding: const EdgeInsets.all(30),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.6,
              width: size.width,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: size.height * 0.31,
              left: 0,
              right: 0,
              child: Container(
                height: 337,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0x00000000),
                      const Color(0x00000000).withOpacity(0.8),
                      const Color(0x00000000),
                      const Color(0x00000000).withOpacity(0.63),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.325,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 25,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: CustomContainer(
                        title: part,
                        height: 31,
                        width: 81,
                      ),
                    ),
                    const SizedBox(width: 40),
                    SizedBox(
                      // padding: const EdgeInsets.only(bottom: 15),
                      height: 110,
                      width: 232,
                      child: Text(
                        title,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -size.height * 0.54,
              child: Container(
                height: size.height,
                width: size.width,
                // color: Colors.cyan,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AssetsData.loginDecoration,
                      ),
                      fit: BoxFit.cover),
                ),
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SaveIcon(
                          isSaved: isSaved,
                          onTap: toggleIsSavedState,
                        ),
                        Row(
                          children: [
                            Text(
                              publisher,
                              style: Styles.textStyle14Nunito,
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              AssetsData.accountIcon,
                              width: 24.67,
                              height: 24.67,
                            )
                          ],
                        )
                      ],
                    ),
                    RichText(
                      textDirection: TextDirection.rtl,
                      maxLines: 6,
                      text: TextSpan(
                        children: [
                          for (int i = 0; i < linesList.length - 1; i++)
                            TextSpan(
                              text: '${linesList[i]}\n',
                              style: Styles.textStyle15.copyWith(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff252525),
                              ),
                            ),
                          TextSpan(
                            text: lastLine,
                            style: Styles.textStyle15.copyWith(
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color(0xff252525).withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "متابعة القراءة",
                              style: Styles.textStyle13.copyWith(
                                color: const Color(0xff3E6897),
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          date,
                          style: GoogleFonts.nunito(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff696969)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.565,
              left: 30,
              child: SizedBox(
                child: SvgPicture.asset(
                  imageWithOpacity,
                  fit: BoxFit.contain,
                  // width: 170,
                  // height: 151,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
