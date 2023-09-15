import 'package:ai_chat_flutter/constants/app_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/welcom_screen/welcome_controller.dart';
import 'package:ai_chat_flutter/constants/image_constant.dart';
import 'package:ai_chat_flutter/routes/app_pages.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:ai_chat_flutter/widget/button_with_icon.dart';
import 'package:ai_chat_flutter/widget/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/screen_util.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: BASE_WIDTH, allowFontScaling: true)
      ..init(context);
    return Scaffold(
     body: Center(
       child: SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           Image.asset(ImageConstant.icChatgpt),
           SizedBox(height: 70.h),
           Padding(
             padding:  EdgeInsets.symmetric(vertical: 11.h),
             child: Text('Welcome to', style: Style().h2Bold,),
           ),
           Text('ChattyAI 👋',style: Style().h2Bold.copyWith(color: Style.primaryColor,)),
           SizedBox(height: 77.h,),
           RadiusButton(
            maxWidth: double.maxFinite,
            text: 'Log in'.tr,
            backgroundColor: Style.primaryColor,
            textColor: Colors.white,
            isFullWidth: true,
            radius: 100,
            innerPadding: EdgeInsets.symmetric(vertical: 20.h),
            outsidePadding: EdgeInsets.symmetric(horizontal: 24.w),
             fontSize: 18.sp,
            onTap: () {
              Get.toNamed(AppRoutes.login);
            },
           ),
           SizedBox(height: 24.h,),
           RadiusButton(
            isFullWidth: true,
            maxWidth: double.maxFinite,
            text: 'Sign up'.tr,
            fontSize: 18,
            backgroundColor: Style.primary50,
            textColor: Style.primaryColor,
            outsidePadding: EdgeInsets.symmetric(horizontal: 24.w),
            innerPadding: EdgeInsets.symmetric(vertical: 20.h),
            radius: 100,
             onTap: () {
              Get.toNamed(AppRoutes.register);
            },
           ),
           SizedBox(height: 77.h,),
           Row(
               children: [
                const Expanded(child: Divider()),
                Text('or continue with', style: Style().h6Medium,),
                const Expanded(child: Divider()),
               ],
           ),
           SizedBox(height: 24.h,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  IconSocal(icon: ImageConstant.icFacebook, onTap: () {  },),
                  SizedBox(width: 10.w,),
                  IconSocal(icon: ImageConstant.icGoogle, onTap: () {  },),
                    SizedBox(width: 10.w,),
                  IconSocal(icon: ImageConstant.icApple, onTap: () {  },),
                 ],
           ),
                
                
           ],
           ),
         ),
       ),
     ),
    );
  }
}

