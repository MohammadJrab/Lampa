import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';
import '../pages/for_you_list_view_builder.dart';
import 'icon_animation.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 2, length: 3, vsync: this);
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

  @override
  void dispose() {
    _tabController.dispose();
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
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
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 50,
                        width: size.width - 100,
                        child: TabBar(
                          isScrollable: false, padding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          controller: _tabController,
                          indicatorColor: Colors.white,
                          unselectedLabelStyle: Styles.textStyle17,
                          labelStyle: Styles.textStyle18
                              .copyWith(fontWeight: FontWeight.w600),
                          // labelPadding: const EdgeInsets.only(top: 20),

                          tabs: const [
                            Tab(
                              text: 'اكتشف أكثر',
                            ),
                            Tab(
                              text: 'يومي',
                            ),
                            Tab(
                              text: 'من أجلك',
                            ),
                          ],
                        ),
                      ),
                      IconAnimation(
                        angle: _animation,
                        animation: _animationController,
                        isExpanded: isExpanded,
                        onTap: () => _toggleExpandedState(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.9,
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      Text("Explore More"),
                      Text("Today"),
                      ForYouListViewBuilder(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // const Positioned(bottom: 0, child: CustomBottonNavigationBar()),
        ],
      ),
    );
  }
}
