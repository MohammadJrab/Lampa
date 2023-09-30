import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamba/features/Home/presentation/widgets/videos_container.dart';
import 'package:lamba/utils/assets.dart';
import 'package:lamba/utils/styles.dart';

class DailyView extends StatelessWidget {
  const DailyView({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 220,
              width: 314,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 203,
                      width: 314,
                      child: SvgPicture.asset(
                        AssetsData.paper,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 38.0,
                    top: 0,
                    child: SvgPicture.asset(
                      AssetsData.paperTool,
                      fit: BoxFit.cover,
                      height: 39,
                      width: 19.17,
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    top: 55,
                    child: SizedBox(
                      height: 100,
                      child: Text("نصائح رند",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff0D0D0D),
                          )),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 100,
                    child: SizedBox(
                      height: 100,
                      child: Text(
                        '''تجرأ علی كسرِ قيودكَ وقلْ “لا” في وجهِ 
الأفكار الدخيلة إلی ذاتك''',
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: Styles.textStyle15,
                      ),
                    ),
                  ),

                  // CustomPaint(
                  //   painter: TrianglePainter(),
                  //   size: const Size(102, 50),
                  // ),
                  Positioned(
                    top: 18,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 73,
                      width: 102,
                      child: SvgPicture.asset(
                        AssetsData.paperLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 45),
            const VideoContainer(),
            const SizedBox(height: 45),
            const VideoContainer(),
            const SizedBox(height: 45),
            const VideoContainer(),
            const SizedBox(height: 45),
            const VideoContainer(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xffFFFFFF).withOpacity(.40)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
