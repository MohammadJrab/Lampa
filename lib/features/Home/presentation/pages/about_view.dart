import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamba/features/Home/data/models/about_us_model.dart';
import 'package:lamba/features/Home/presentation/widgets/Identity_of_the_specialist_btn.dart';
import 'package:lamba/features/Home/presentation/widgets/animated_container_with_read_more.dart';
import 'package:lamba/features/Home/presentation/widgets/home_background.dart';
import 'package:lamba/features/Home/presentation/widgets/icon_animation.dart';
import 'package:lamba/features/Home/presentation/widgets/notifications_icon.dart';
import 'package:lamba/utils/assets.dart';
import 'package:lamba/utils/styles.dart';
import 'package:simple_shadow/simple_shadow.dart';

class AboutView extends StatefulWidget {
  const AboutView({
    super.key,
  });

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isExpanded = false;
  final List<AboutUSModel> aboutUSModel = const [
    AboutUSModel(
      title: "الميزات التي تقدمها لك الأخصائية",
      subtitle:
          '''بعد طلب الاستشارة النفسية بهدف العلاج النفسي يتم تشخيص الحالة من خلال الأسئلة للشخص وتحديد مايحتاجه من وقت وآلية طريق للعلاج والتشافي
رحلة علاجك النفسي سوف تكون متكاملة من خلال المتابعة المجانية لمدة شهر بعد الانتهاء من الوقت المحدد للعلاج والتشافي .
تقديم العلاج النفسي التحليلي أو التدريب السلوكي أو المعرفي بواسطة مجموعة متنوعة من الأساليب والتقنيات والاستراتيجيات المستخدمة بناءً على حاجة الشخص وطبيعة مشكلته ، والمرونة في تغيير الطرق حتى يستجيب الشخص لعملية التشافي والتعافي .
علاج جميع الاضطرابات والمشكلات بدون أدوية نفسية باستثناء حالات نادرة تُحال إلى الطبيب .
التمتع بأعلى درجات الثقة والأمان وجميع البيانات سرية . .''',
      backgroundImage: AssetsData.star,
      image: AssetsData.startBoy,
    ),
    AboutUSModel(
      title: "العلاجات التي تقدمها لك الأخصائية",
      subtitle:
          '''الاضطرابات النفسية مثل : الاكتئاب وأنواعه : اكتئاب مابعد الصدمات ، اكتئاب مابعد الولادة ، حالات الطلاق ، اضطراب ثنائي القطب ، تقلبات المزاج ،''',
      backgroundImage: AssetsData.medicament,
      image: AssetsData.medicamentBoy,
    ),
    AboutUSModel(
      title: "متى عليك أن تطلب الاستشارة",
      subtitle:
          '''عندما تتراكم عليك الضغوط اليوميةوتتكدس الذكريات المؤلمة فيظهر صوت في داخلك بالتعب والوهن النفسي والبحث عن الحقيقة والاستشارة النفسية كي تفرّغ جميع ال...... ''',
      backgroundImage: AssetsData.transparent,
      image: AssetsData.starBoy,
    ),
    AboutUSModel(
      title: "إلى أين ستصل",
      subtitle:
          '''إلى أين ستصل خلال رحلة المتابعة في العلاجات النفسية والسلوكية والمعرفية ؟إن الاستشارة وعملية المتابعة بالعلاج النفسي و السلوكي تحقق:
لتواصل والتصالح مع الذات ،,,,,,,,''',
      backgroundImage: AssetsData.goal,
      image: AssetsData.goalGirl,
    ),
  ];
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  final TextStyle selectedFont = Styles.textStyle11.copyWith(
    color: const Color(0xff222222),
  );
  final TextStyle unselectedFont = Styles.textStyle9;
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpandedState() {
    setState(() {
      if (isExpanded) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
      isExpanded = !isExpanded;
    });
  }

  int selectedFilterIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return HomeBackground(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 31, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const NotificationIcon(count: "2"),
                        const Spacer(),
                        IconAnimation(
                          angle: _animation,
                          animation: _animationController,
                          isExpanded: isExpanded,
                          onTap: () => _toggleExpandedState(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * .05, left: 0, right: 0,
              // right: size.width * .44,
              child: Column(
                children: [
                  SimpleShadow(
                    opacity: 0.25,
                    color: Colors.black,
                    offset: const Offset(0, 2),
                    sigma: 3,
                    child: Text(
                      "من نحن",
                      textAlign: TextAlign.center,
                      style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.12,
              child: Container(
                height: size.height * .8,
                width: size.width,
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
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  children: [
                    const ProfileContainer(),
                    const SizedBox(height: 18),
                    const OurSiteContainer(),
                    const SizedBox(height: 18),
                    SizedBox(
                        height: 314,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: SizedBox(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    AnimatedContainerWithReadMore(
                                      title: aboutUSModel[0].title,
                                      subtitle: aboutUSModel[0].subtitle,
                                      backgroundImage:
                                          aboutUSModel[0].backgroundImage,
                                      image: aboutUSModel[0].image,
                                    ),
                                    AnimatedContainerWithReadMore(
                                      title: aboutUSModel[0].title,
                                      subtitle: aboutUSModel[0].subtitle,
                                      backgroundImage:
                                          aboutUSModel[0].backgroundImage,
                                      image: aboutUSModel[0].image,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AnimatedContainerWithReadMore(
                                      title: aboutUSModel[0].title,
                                      subtitle: aboutUSModel[0].subtitle,
                                      backgroundImage:
                                          aboutUSModel[0].backgroundImage,
                                      image: aboutUSModel[0].image,
                                    ),
                                    AnimatedContainerWithReadMore(
                                      title: aboutUSModel[0].title,
                                      subtitle: aboutUSModel[0].subtitle,
                                      backgroundImage:
                                          aboutUSModel[0].backgroundImage,
                                      image: aboutUSModel[0].image,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OurSiteContainer extends StatelessWidget {
  const OurSiteContainer({super.key});

  static const String ourSiteString = '''
موقعنا الرئيسي في سورية ، مدينة حلب وموقعنا هنا لطلب الاستشارات عبر الانترنت بجلسات فيديو أو التواصل الصوتي أو الكتابي .''';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 82,
      padding: const EdgeInsets.only(left: 15, right: 17, top: 10, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 15,
                bottom: 0,
                child: ContanctWithUSButton(
                  onTap: () {},
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 4),
                width: MediaQuery.of(context).size.width * .65,
                child: Text(
                  ourSiteString,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: Styles.textStyle9.copyWith(
                    color: const Color(0xff444444),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 10),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 41,
              height: 41,
              child: SvgPicture.asset(AssetsData.whatsApp),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});
  static const String profileString =
      '''آمنتُ بعلم النفس والسلوك وأن الإنسان يمكنه التشافي من اضطراباته الشعورية والفكرية ليستعيد قوته الحقيقية ويحقّق التوازن النفسي مع الحياة من خلال جلسات الوعي والإرشاد والعلاج للوصول للتعافي . رسالتي : مساعدة الإنسان الرجوع إلى فطرته من خلال الدخول لأعماقه وإجراء عملية جراحية نفسية بسلاسة بواسطة إرشادات حياتية بسيطة.''';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 175,
      padding: const EdgeInsets.only(left: 7, right: 17, top: 15, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            child: SizedBox(
                width: 126,
                height: 126,
                child: SvgPicture.asset(
                  AssetsData.searchSvg,
                  fit: BoxFit.cover,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.562,
                height: 130,
                child: Text(
                  profileString,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: Styles.textStyle9.copyWith(
                    color: const Color(0xff444444),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 71,
                height: MediaQuery.of(context).size.width * 0.33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          AssetsData.profile,
                        ))
                    // color: Colors.amber,
                    ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 4.8,
                      left: .5,
                      right: .5,
                      child: Container(
                        // width: 71,
                        height: 92,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                              bottom: 5, left: 15, right: 15),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'الأخصائية رنده حجازي',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 15,
            bottom: 15,
            child: IdentityOfTheSpecialistButton(onTap: () {}),
          )
        ],
      ),
    );
  }
}
