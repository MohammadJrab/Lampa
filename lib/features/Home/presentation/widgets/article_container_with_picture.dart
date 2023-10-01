import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamba/features/Home/presentation/widgets/save_icon.dart';
import 'package:lamba/utils/assets.dart';
import 'package:lamba/utils/styles.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ArticleContainerWithPicture extends StatefulWidget {
  final String title;
  final String subtitle;
  final String backgroundImage;
  final String image;
  // final bool isSaved;
  // final void Function() onTapSave;

  const ArticleContainerWithPicture({
    super.key,
    required this.title,
    required this.subtitle,
    required this.backgroundImage,
    required this.image,
  });

  @override
  _ArticleContainerWithPictureState createState() =>
      _ArticleContainerWithPictureState();
}

class _ArticleContainerWithPictureState
    extends State<ArticleContainerWithPicture> {
  bool isReadMore = false;
  bool isSaved = false;
  void toggleIsSavedState() {
    setState(() {
      if (isSaved) {
        isSaved = false;
      } else {
        isSaved = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // const SizedBox(height: 40),
        AnimatedContainer(
      height: isReadMore ? 278 : 152,
      width: isReadMore ? 313 : 313,
      duration: const Duration(milliseconds: 2000),
      curve: Curves.easeOutCirc,
      child: Stack(
        children: [
          SimpleShadow(
            opacity: 0.15,
            color: Colors.black,
            offset: const Offset(0, 4),
            sigma: 2,
            child: AnimatedContainer(
              height: isReadMore ? 266 : 152,
              width: isReadMore ? 313 : 313,
              duration: const Duration(milliseconds: 2000),
              curve: Curves.easeOutCirc,
              transformAlignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 15,
                    child: SaveIcon(
                      onTap: toggleIsSavedState,
                      isSaved: isSaved,
                      color: const Color(0xff3E6897),
                      height: 19,
                      width: 14,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 32,
                    child: SvgPicture.asset(
                      widget.backgroundImage,
                      width: 95,
                      height: 95,
                    ),
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 400),
                    crossFadeState: isReadMore
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: Positioned(
                      top: 18,
                      right: 134,
                      child: SizedBox(
                        height: 45,
                        width: 180,
                        child: Text(
                          widget.title.split(" ").first,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.cairo(
                            fontSize: 20,
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff222222),
                          ),
                        ),
                      ),
                    ),
                    secondChild: SizedBox(
                      height: 57,
                      width: 180,
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          fontSize: 13,
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff222222),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 165,
                    child: Text(
                      widget.subtitle,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      maxLines: isReadMore ? null : 4,
                      softWrap: true,
                      overflow: isReadMore ? null : TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff585858),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 175,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!isReadMore)
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: readMoreButton(),
                          ),
                        Row(
                          children: [
                            Text(
                              "21",
                              style: Styles.textStyle8,
                            ),
                            const SizedBox(width: 2.7),
                            SvgPicture.asset(AssetsData.comment),
                            const SizedBox(width: 6),
                            Text(
                              "44",
                              style: Styles.textStyle8,
                            ),
                            const SizedBox(width: 2.7),
                            SvgPicture.asset(AssetsData.like),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isReadMore)
            Positioned(
              bottom: 0,
              left: 150,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isReadMore = false;
                  });
                },
                child: SimpleShadow(
                  opacity: 0.15,
                  color: Colors.black,
                  offset: const Offset(0, 0),
                  sigma: 4,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.expand_less_rounded,
                      size: 20,
                      color: Colors.black,
                      weight: 2,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  GestureDetector readMoreButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isReadMore = !isReadMore;
        });
      },
      child: SizedBox(
        width: 23,
        height: 12,
        child: Text(
          isReadMore ? "أقل" : "المزيد",
          style: GoogleFonts.cairo(
            fontSize: 7,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            color: const Color(0xff3E6897),
          ),
        ),
      ),
    );
  }
}
