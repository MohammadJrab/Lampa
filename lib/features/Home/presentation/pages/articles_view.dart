import 'package:flutter/material.dart';
import 'package:lamba/features/Home/data/models/aritcle_model.dart';
import 'package:lamba/features/Home/presentation/widgets/article_container_with_picture.dart';
import 'package:lamba/utils/styles.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';
import '../widgets/article_container.dart';
import '../widgets/custom_tab_container.dart';
import '../widgets/home_background.dart';
import '../widgets/icon_animation.dart';
import '../widgets/notifications_icon.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key});

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late TabController _tabController;
  bool isExpanded = false;
  List<Card> cards = [
    Card(height: 30, width: 80, title: 'نوع المقالة'),
    Card(height: 30, width: 80, title: 'نوع المقالة'),
    Card(height: 30, width: 80, title: 'نوع المقالة'),
    Card(height: 30, width: 80, title: 'نوع المقالة'),
    Card(height: 30, width: 80, title: 'الكل'),
  ];
  int selectedCardIndex = 0;
  String subtileOfArticl =
      '''هنا سيتم كتابة في حال اختيار قسم معين من المقالات  نبدة عن هدا النوع من المقالات ولمادا تتحدث الاخصائية عنه\nوكيفية قراء هدا النوع من المقالات.......''';
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
    _tabController = TabController(
        initialIndex: cards.length - 1, length: cards.length, vsync: this);
  }

  final TextStyle selectedFont = Styles.textStyle11.copyWith(
    color: const Color(0xff222222),
  );
  final TextStyle unselectedFont = Styles.textStyle9;
  @override
  void dispose() {
    _animationController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _toggleExpandedState() {
    Scaffold.of(context).openEndDrawer();
    // setState(() {
    //   if (isExpanded) {
    //     _animationController.reverse();
    //   } else {
    //     _animationController.forward();
    //     Scaffold.of(context).openEndDrawer();
    //   }
    //   isExpanded = !isExpanded;
    // });
  }

  List<AricleModel> articles = const [
    AricleModel(
        title: "الغربة والحاجة إلى الإندماج في المجتمعات الغربية",
        backgroundImage: AssetsData.airplanePicture,
        image: AssetsData.alienation,
        subtitle:
            '''اتصلّت بي امرأة ، تركت بلدها العربي لظروف قاهرة ، لتعيش في ألمانيا منذ خمس سنوات .قالت لي : توقف الزمن عندي منذ هاجرت لأوروبا .. لم أستطع الاندماج ، وجدتُ صعوبة في تعلم اللغة ، لم أتقبّل الناس وطبائعهم ، وللأسف لا......n
أستطيع العودة إلى بلدي .
ماهي الغربة؟..أسبابها؟ فكرة السفر إلى الخارج....
فكرة السفر إلى الخارج كانت موجودة منذ زمن بعيد،كانت …إما بسبب البحث عن العمل ، أو الدراسة.لكن مؤخراً مع ظهور الحروب والفوضى التي كانت منتشرة في الوطن العربي بشكل عام ، وفي سوريا بشكل خاص؛ أصبح السفر ضرورة حتمية للبحث عن الأمان والاستقرار، خاصة وأن هناك الكثير من الأشخاص الذين خسروا منازلهم وعملهم بسبب الحرب، واضطروا لأن.....'''),
  ];

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
              top: size.height * .05,
              // right: size.width * .44,
              child: Column(
                children: [
                  SimpleShadow(
                    opacity: 0.25,
                    color: Colors.black,
                    offset: const Offset(0, 2),
                    sigma: 3,
                    child: Text(
                      "المقالات",
                      textAlign: TextAlign.center,
                      style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    // height: 50,
                    width: size.width,
                    child: TabBar(
                      isScrollable: true,
                      physics: const BouncingScrollPhysics(),
                      controller: _tabController,
                      unselectedLabelStyle: Styles.textStyle16,
                      padding: const EdgeInsets.only(right: 40, left: 25),
                      labelStyle: Styles.textStyle24,
                      labelPadding: const EdgeInsets.only(bottom: 20, right: 5),
                      indicator: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetsData.tabBarIndicator),
                          fit: BoxFit.none,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                      tabs: cards.map((card) {
                        final isSelected =
                            _tabController.index == cards.indexOf(card);
                        final font = isSelected ? selectedFont : unselectedFont;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCardIndex = cards.indexOf(card);
                            });
                          },
                          child: CustomTabContainer(
                            height: isSelected ? 31 : 25,
                            width: isSelected ? 81 : 65.52,
                            title: card.title,
                            font: font,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.178,
              child: Container(
                height: size.height * .7,
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
                padding: const EdgeInsets.only(top: 24, left: 30, right: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ArticleContainer(
                        typeOfArticle: "نوع المقالة",
                        subtitle: subtileOfArticl,
                        publisher: "رند حجازي",
                        image: AssetsData.lampPicture,
                      ),
                      const SizedBox(height: 26),
                      SizedBox(
                        height: 32,
                        child: ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(right: 11.0),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            final isSelected = index == selectedFilterIndex;
                            String label;

                            if (index == 0) {
                              label = "الأحدث";
                            } else if (index == 1) {
                              label = "الرائجة";
                            } else {
                              label = "الأقدم";
                            }

                            return SizedBox(
                              width: isSelected ? 76 : 66,
                              height: isSelected ? 29 : 25,
                              child: FilterChip(
                                label: Text(label),
                                selected: isSelected,
                                backgroundColor: const Color(0xffFFFFFF),
                                selectedColor: const Color(0xff3E6897),
                                shadowColor: Colors.black,
                                showCheckmark: false,
                                labelStyle: isSelected
                                    ? Styles.textStyle11.copyWith(
                                        color: const Color(0xffFFFFFF),
                                      )
                                    : Styles.textStyle10.copyWith(
                                        color: const Color(0xff222222),
                                      ),
                                onSelected: (bool value) {
                                  setState(() {
                                    selectedFilterIndex = index;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 11),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ArticleContainerWithPicture(
                              title: articles[0].title,
                              subtitle: articles[0].subtitle,
                              image: articles[0].image,
                              backgroundImage: articles[0].backgroundImage,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     height: size.height * .61,
            //     width: size.width,
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage(
            //             AssetsData.loginDecoration,
            //           ),
            //           fit: BoxFit.cover),
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(30),
            //         topRight: Radius.circular(30),
            //       ),
            //     ),
            //     child:
            //         Center(child: SvgPicture.asset(AssetsData.searchPicture)),
            //   ),
            // )
            // Positioned(
            //   top: size.height * 0.2,
            //   right: size.width * .1,
            //   child: SearchTextField(
            //     controller: searchController,
            //     firstPartIcon: AssetsData.searchIcon,
            //     hint: "اكتب هنا نص للبحث",
            //     secondPartIcon: AssetsData.transparent,
            //   ),
            // )
            // const Positioned(bottom: 0, child: CustomBottonNavigationBar()),
          ],
        ),
      ),
    );
  }
}

class Card {
  final double height;
  final double width;
  final String title;

  Card({required this.height, required this.width, required this.title});
}
