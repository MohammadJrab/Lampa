import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamba/utils/assets.dart';
import 'package:lamba/utils/styles.dart';

class ArticleContainer extends StatelessWidget {
  final String typeOfArticle;
  final String subtitle;
  final String publisher;
  final String image;

  const ArticleContainer({
    super.key,
    required this.typeOfArticle,
    required this.subtitle,
    required this.publisher,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    List<String> linesList = subtitle.split('\n');
    String lastLine = linesList.last;
    return Container(
      width: 314,
      height: 168,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(
            image,
            width: 149.04,
            height: 144.19,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 27, top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    typeOfArticle,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff222222),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  textDirection: TextDirection.rtl,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      for (int i = 0; i < linesList.length - 1; i++)
                        TextSpan(
                          text: '${linesList[i]}\n',
                          style: Styles.textStyle11.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff4C4C4C),
                          ),
                        ),
                      TextSpan(
                        text: lastLine,
                        style: Styles.textStyle11.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff4C4C4C).withOpacity(0.53)),
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
                          "المزيد",
                          style: Styles.textStyle9.copyWith(
                            color: const Color(0xff3E6897),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          publisher,
                          style: Styles.textStyle10.copyWith(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff3E6897)),
                        ),
                        const SizedBox(width: 5),
                        SvgPicture.asset(
                          AssetsData.accountIcon,
                          color: const Color(0xff3e6897).withOpacity(0.94),
                          width: 15.0,
                          height: 15.0,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
