import 'package:ai_chat_flutter/constants/image_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/login/login.dart';
import 'package:ai_chat_flutter/routes/app_pages.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:ai_chat_flutter/utils/screen_util.dart';
import 'package:ai_chat_flutter/widget/button_with_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'introduction_controller.dart';

class IntroductionPage extends GetView<IntroductionController> {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 430, allowFontScaling: true)
      ..init(context);
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: Get.height - 300.h,
                  width: Get.width.w,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.pages.length,
                    onPageChanged: (value) {
                      controller.indexPage.value = value;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(controller.pages[index],width: Get.width.w,height:Get.height.h - 300.h ,);
                    },
                  ),
                ),
                Positioned(
                  bottom: -10.w,
                  left: 0,
                  top: 320.h,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.9),
                          Colors.white.withOpacity(1),
                          Colors.white.withOpacity(1),
                          
                        ], // Gradient from https://le
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.h,
                  right: 16.w,
                  left: 16.w,
                  child: Text(
                    controller.title[controller.indexPage.value],
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Style().h3Bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                textAlign: TextAlign.center,
                style: Style().bodyXLargeRegular,
              ),
            ),
            SizedBox(height: 32.h,),
            SmoothPageIndicator(
              controller: controller.pageController, // Sử dụng controller từ controller của bạn
              count: controller.pages.length, // Tổng số trang
              effect: ExpandingDotsEffect(
              activeDotColor: Style.primaryColor,
              dotHeight: 8.h
              ), // Chọn hiệu ứng chỉ số trượt
              
            ),
            SizedBox(height: 37.h), // Khoảng cách giữa chỉ số trượt và nút

            Row(
              
              children: [
                    Expanded(
            child: RadiusButton(
              
                isFullWidth: true,
                outsidePadding:  EdgeInsets.only(top: 0, bottom: 0, left: 16.w, right: 8.w),
                text: 'Skip'.tr,
                fontSize: 18.sp,
                backgroundColor: Color(0xffE8FAF4),
                textColor: Style.primaryColor,
                 radius: 100,
                onTap: () {
               controller.pageController.animateToPage(
                        controller.indexPage.value - 1, // Chuyển đến trang kế tiếp
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                },
              ),
                    ),
                
                    Expanded(
            child: RadiusButton(
                isFullWidth: true,
              
               outsidePadding:  EdgeInsets.only(top: 0, bottom: 0, left: 16.w, right: 8.w),
                
                text: 'Next'.tr,
                fontSize: 18.sp,
                backgroundColor: Style.primaryColor,
                textColor: Color(0xffFFFFFF),
               radius: 100,
                onTap: () {
                  if(controller.indexPage.value == 2) {
                   Get.toNamed(AppRoutes.welcom_screen);
                  }
               controller.pageController.animateToPage(
                        controller.indexPage.value + 1, // Chuyển đến trang kế tiếp
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                },
              ),
                    ),
            
              ],
            ),
          ],
        ),
      ),
    );
  }
}
