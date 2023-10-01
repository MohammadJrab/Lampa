import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lamba/features/Home/presentation/widgets/icon_animation.dart';
import 'package:lamba/utils/assets.dart';
import 'package:lamba/utils/styles.dart';
import 'package:simple_shadow/simple_shadow.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isExpanded = true;

  bool _isDrawerOpen = false;

  void _toggleExpandedState() {
    setState(() {
      if (isExpanded) {
        _animationController.reverse();
        Scaffold.of(context).closeEndDrawer();
      } else {
        _animationController.forward();
      }
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _toggleDrawer();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final slideAmount = MediaQuery.of(context).size.width *
                (_animationController.value - 1);
            return Transform.translate(
              offset: Offset(slideAmount, 0),
              child: child,
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 21,
                    offset: const Offset(0, -9),
                    color: const Color(0xff000000).withOpacity(0.01),
                  ),
                ],
                image: const DecorationImage(
                    image: AssetImage(AssetsData.drawerBackgound),
                    fit: BoxFit.cover,
                    opacity: 0.9)),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final slideAmount = MediaQuery.of(context).size.width *
                  -(_animationController.value - 1);
              return Transform.translate(
                offset: Offset(slideAmount, 0),
                child: child,
              );
            },
            child: Container(
              width: size.width * 0.7,
              height: size.height,
              decoration: const BoxDecoration(
                color: Color(0xff3E6897),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: DrawerBackground(
                  child: Positioned(
                top: 20,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconAnimation(
                      angle: _animation,
                      animation: _animationController,
                      isExpanded: isExpanded,
                      onTap: () => _toggleExpandedState(),
                    ),
                    SizedBox(height: size.height * 0.06),
                    const Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: ProfileInformationDrawer(
                          name: "مصطفى حصرية", image: AssetsData.travelPicture),
                    ),
                    SizedBox(
                      height: size.height * 0.058,
                    ),
                    SizedBox(
                      height: size.height * 0.8,
                      width: size.width * 0.7,
                      child: Align(
                        alignment: Alignment.center,
                        child: ListView(
                          children: [
                            CustomListTile(
                              isSelected: true,
                              title: "الشاشة الرئيسية",
                              icon: AssetsData.homeDrawerIcon,
                              onTap: () {},
                            ),
                            const SizedBox(height: 10),
                            CustomListTile(
                              isSelected: false,
                              title: "البروفايل",
                              icon: AssetsData.profileDrawerIcon,
                              onTap: () {},
                            ),
                            const SizedBox(height: 10),
                            CustomListTile(
                              isSelected: false,
                              title: "المقالات المحفوظة",
                              icon: AssetsData.savedArticlesDrawerIcon,
                              onTap: () {},
                            ),
                            const SizedBox(height: 10),
                            CustomListTile(
                              isSelected: false,
                              title: "المفضلة",
                              icon: AssetsData.favouriteIcon,
                              onTap: () {},
                            ),
                            const SizedBox(height: 10),
                            CustomListTile(
                              isSelected: false,
                              title: "الاعدادات",
                              icon: AssetsData.settingsIcon,
                              onTap: () {},
                            ),
                            const SizedBox(height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  width: 118,
                                  padding: const EdgeInsets.only(right: 25),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 35),
                            CustomListTile(
                              isSelected: false,
                              title: "تسجيل خروج",
                              icon: AssetsData.signoutIcon,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final void Function()? onTap;
  const CustomListTile({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        color: isSelected ? const Color(0xffFDCAE5).withOpacity(.15) : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 17),
              child: SvgPicture.asset(icon),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileInformationDrawer extends StatelessWidget {
  final String name;
  final String image;

  const ProfileInformationDrawer({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleImageProfile(image: image),
        const SizedBox(height: 10),
        Text(
          "مرحبا,",
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: Styles.textStyle16,
        ),
        Text(
          name,
          maxLines: 1,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: Styles.textStyle16,
        ),
      ],
    );
  }
}

class CircleImageProfile extends StatelessWidget {
  final String image;
  const CircleImageProfile({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: 63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: const Border.fromBorderSide(
            BorderSide(width: 2, color: Colors.white)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
  }
}

class DrawerBackground extends StatelessWidget {
  final Widget child;

  const DrawerBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -10,
          left: 33,
          child: Opacity(
            opacity: 0.5,
            child: SimpleShadow(
              opacity: 0.25,
              color: Colors.black,
              offset: const Offset(0, 4),
              sigma: 4,
              child: SizedBox(
                height: 66,
                width: 98,
                child: SvgPicture.asset(
                  fit: BoxFit.cover,
                  AssetsData.cloud,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 34,
          left: 77,
          child: SimpleShadow(
            opacity: 0.25,
            color: Colors.black,
            offset: const Offset(0, 4),
            sigma: 4,
            child: SizedBox(
              height: 31,
              width: 50,
              child: SvgPicture.asset(
                fit: BoxFit.fill,
                AssetsData.cloud,
              ),
            ),
          ),
        ),
        Positioned(
          top: 91,
          right: 13,
          child: Opacity(
            opacity: 0.22,
            child: SimpleShadow(
              opacity: 0.25,
              color: Colors.black,
              offset: const Offset(0, 4),
              sigma: 4,
              child: SizedBox(
                height: 41,
                width: 70,
                child: SvgPicture.asset(
                  fit: BoxFit.fill,
                  AssetsData.cloudR,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 514,
          left: 9,
          child: Opacity(
            opacity: 0.15,
            child: SimpleShadow(
              opacity: 0.25,
              color: Colors.black,
              offset: const Offset(0, 4),
              sigma: 4,
              child: SizedBox(
                height: 24,
                width: 46,
                child: SvgPicture.asset(
                  fit: BoxFit.fill,
                  AssetsData.cloud,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -15,
          right: -16,
          child: Opacity(
            opacity: 0.33,
            child: SimpleShadow(
              opacity: 0.25,
              color: Colors.black,
              offset: const Offset(0, 2),
              sigma: 4,
              child: SizedBox(
                height: 64,
                width: 131,
                child: SvgPicture.asset(
                  fit: BoxFit.fill,
                  AssetsData.cloudR,
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
