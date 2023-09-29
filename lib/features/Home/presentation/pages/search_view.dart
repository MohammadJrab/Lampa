import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lamba/utils/styles.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../utils/assets.dart';
import '../widgets/home_background.dart';
import '../widgets/icon_animation.dart';
import '../widgets/notifications_icon.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController searchController = TextEditingController();

  bool isExpanded = false;

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

  @override
  void dispose() {
    _animationController.dispose();
    searchController.dispose();
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
              top: size.height * 0.045, right: size.width * 0.07,
              // right: size.width * .44,
              child: Column(
                children: [
                  SimpleShadow(
                    opacity: 0.25,
                    color: Colors.black,
                    offset: const Offset(0, 2),
                    sigma: 3,
                    child: Text(
                      "البحث",
                      textAlign: TextAlign.center,
                      style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  SearchTextField(
                    controller: searchController,
                    searchIcon: AssetsData.searchIcon,
                    hint: "اكتب هنا نص للبحث",
                    filterIcon: AssetsData.filterIcon,
                    width: size.width * .85,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * .61,
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
                child:
                    Center(child: SvgPicture.asset(AssetsData.searchPicture)),
              ),
            )
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

class SearchTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final String searchIcon;
  final String filterIcon;
  final double width;

  const SearchTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.searchIcon,
    required this.filterIcon,
    required this.width,
  });

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.filterIcon),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              textAlign: TextAlign.right,
              textInputAction: TextInputAction.next,
              textDirection: TextDirection.ltr,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              style:
                  Styles.textStyle12.copyWith(color: const Color(0xff222222)),
              decoration: InputDecoration(
                  hintText: widget.hint,
                  contentPadding: const EdgeInsets.only(
                      bottom: 10.0, right: 5.0, left: 5.0),
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: Styles.textStyle12.copyWith(
                    color: const Color(0xff292929).withOpacity(0.74),
                  ),
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          const SizedBox(width: 15),
          SvgPicture.asset(widget.searchIcon),
        ],
      ),
    );
  }
}
