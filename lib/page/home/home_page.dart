import 'package:ai_chat_flutter/constants/app_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/home/home.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:ai_chat_flutter/utils/screen_util.dart';
import 'package:ai_chat_flutter/widget/animatedBottomNavigationBar/animated_bottom_navigation_bar.dart';
import 'package:ai_chat_flutter/widget/indexed_transition_switcher.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: BASE_WIDTH, allowFontScaling: true)
      ..init(context);
    return Material(
      child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Obx(
            () => Scaffold(
              body: IndexedTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                    fillColor: Colors.transparent,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                index: controller.currentTab.value,
                children: controller.children,
              ),
              bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                itemCount: controller.children.length,
                tabBuilder: (int index, bool isActive) {
                  return _buildBottomNavBar(context, isActive)[index];
                },
                activeIndex: controller.currentTab.value,
                splashColor: context.theme.primaryColor,
                splashSpeedInMilliseconds: 300,
                notchSmoothness: NotchSmoothness.defaultEdge,
                gapLocation: GapLocation.none,
                onTap: controller.switchTab,
              ),
            ),
          )),
    );
  }

  List<Widget> _buildBottomNavBar(BuildContext context, bool isActive) {
    return [
      _buildBottomNavigationBarItem(
        context,
        'Chat'.tr,
        Icons.home,
        0,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'AI Assistants'.tr,
        Icons.star_border,
        1,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'History'.tr,
        Icons.search,
        2,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'Account'.tr,
        Icons.explore_outlined,
        3,
        isActive,
      ),
    ];
  }

  Widget _buildBottomNavigationBarItem(BuildContext context, String title,
      IconData iconUri, int idx, bool active) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCrossFade(
            crossFadeState:
                active ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 250),
            firstChild: Icon(
              iconUri,
              size: 20.w,
              color: Style.primaryColor,
            ),
            secondChild: Icon(
              iconUri,
              size: 20.w,
              color: Style.greyscale500,
            )),
        SizedBox(height: 2.h),
        Text(
          title,
          style: active ? Style().bodyXSmallBold : Style().bodyXSmallMedium,
        )
      ],
    );
  }
}
