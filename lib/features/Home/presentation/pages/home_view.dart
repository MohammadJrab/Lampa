import 'package:flutter/material.dart';
import 'package:lamba/features/Home/presentation/pages/about_view.dart';
import 'package:lamba/features/Home/presentation/pages/search_view.dart';
import 'package:lamba/features/Home/presentation/widgets/custom_drawer.dart';
import '../../../../utils/widgets/custom_botton_navigation_bar.dart';
import '../widgets/home_body.dart';
import 'articles_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const CustomDrawer(), endDrawerEnableOpenDragGesture: false,
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeBody(),
            ArticlesView(),
            SearchView(),
            AboutView(),
          ],
        ),
        bottomNavigationBar: CustomBottonNavigationBar(
          onTabChanged: (index) {
            setState(() {
              currentIndex = index;
              _tabController.animateTo(index);
            });
          },
          currentIndex: currentIndex,
        ),
        // bottomNavigationBar: BottomNavigationBar(),
      ),
    );
  }
}
