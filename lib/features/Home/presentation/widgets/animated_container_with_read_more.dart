import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_shadow/simple_shadow.dart';

class AnimatedContainerWithReadMore extends StatefulWidget {
  final String title;
  final String subtitle;
  final String backgroundImage;
  final String image;
  const AnimatedContainerWithReadMore(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.backgroundImage,
      required this.image});

  @override
  _AnimatedContainerWithReadMoreState createState() =>
      _AnimatedContainerWithReadMoreState();
}

class _AnimatedContainerWithReadMoreState
    extends State<AnimatedContainerWithReadMore> {
  bool isReadMore = false;
  String text =
      '''بعد طلب الاستشارة النفسية بهدف العلاج النفسي يتم تشخيص الحالة من خلال الأسئلة للشخص وتحديد مايحتاجه من وقت وآلية طريق للعلاج والتشافي
رحلة علاجك النفسي سوف تكون متكاملة من خلال المتابعة المجانية لمدة شهر بعد الانتهاء من الوقت المحدد للعلاج والتشافي .
تقديم العلاج النفسي التحليلي أو التدريب السلوكي أو المعرفي بواسطة مجموعة متنوعة من الأساليب والتقنيات والاستراتيجيات المستخدمة بناءً على حاجة الشخص وطبيعة مشكلته ، والمرونة في تغيير الطرق حتى يستجيب الشخص لعملية التشافي والتعافي .
علاج جميع الاضطرابات والمشكلات بدون أدوية نفسية باستثناء حالات نادرة تُحال إلى الطبيب .
التمتع بأعلى درجات الثقة والأمان وجميع البيانات سرية . .''';
  @override
  Widget build(BuildContext context) {
    return
        // const SizedBox(height: 40),
        AnimatedContainer(
      height: isReadMore ? 450 : 160,
      width: isReadMore ? 149 : 149,
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
              height: isReadMore ? 440 : 160,
              width: isReadMore ? 149 : 149,
              duration: const Duration(milliseconds: 2000),
              curve: Curves.easeOutCirc,
              transformAlignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(
                  left: 11, right: 11, top: 10, bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              child: Stack(
                children: [
                  Positioned(
                    top: 22,
                    left: -2,
                    child: SvgPicture.asset(
                      widget.backgroundImage,
                      width: 21,
                      height: 34,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 0,
                    child: SvgPicture.asset(
                      widget.image,
                      width: 20,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45,
                          width: MediaQuery.of(context).size.width * .29,
                          child: Text(
                            widget.title,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.cairo(
                              fontSize: 12,
                              height: 1.4,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff222222),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .29,
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
                        if (!isReadMore)
                          Align(
                              alignment: Alignment.centerLeft,
                              child: readMoreButton())
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
              left: 65,
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
      child: Text(
        isReadMore ? "أقل" : "المزيد",
        style: GoogleFonts.cairo(
          fontSize: 7,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
          color: const Color(0xff3E6897),
        ),
      ),
    );
  }
}
