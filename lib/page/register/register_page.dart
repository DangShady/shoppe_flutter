import 'package:ai_chat_flutter/constants/app_constant.dart';
import 'package:ai_chat_flutter/constants/image_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/register/register_controller.dart';
import 'package:ai_chat_flutter/routes/app_pages.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:ai_chat_flutter/widget/button_with_icon.dart';
import 'package:ai_chat_flutter/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/screen_util.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: BASE_WIDTH, allowFontScaling: true)
      ..init(context);
    return Obx(
      ()=> Scaffold(
        resizeToAvoidBottomInset: false,
    
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                    height: 60.h
                  ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(height: 24.h,),
            Text('Hello there 👋', style: Style().h3Bold,),
            SizedBox(height: 16.h,),
            Text('Please enter your email & password to log in.',style: Style().bodyXLargeRegular,),
            SizedBox(height: 32.h,),
            Text('Email', style: Style().bodyLargeBold),
            SizedBox(height: 16.h,),
            TextFormField(
              style: Style().h5Bold,
              decoration: InputDecoration(
                hintText: 'Email',
               suffixIcon: Icon(Icons.check_box),
               hintStyle: Style().h5Bold.copyWith(color: Color(0xff9E9E9E)),
              ),
            ),
            SizedBox(height: 24.h,),
            Text('Password', style: Style().bodyLargeBold,),
            SizedBox(height: 16.h,),
            TextFormField(
              style: Style().h5Bold,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: Style().h5Bold.copyWith(color: Color(0XFF9E9E9E)),
                suffixIcon: Image.asset(ImageConstant.icNoEye)
              ),
            ),
      SizedBox(height: 24.h,),
      Row(
        children: [
          GestureDetector(
            onTap: () {
              controller.checkBoxed.value =! controller.checkBoxed.value;
            },
            child: controller.checkBoxed.value == false 
            ?  Image.asset(ImageConstant.icCboxFalse) 
            : Image.asset(ImageConstant.icCboxTrue) ),
          SizedBox(width: 16.h,),
         Expanded(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'I agree to ChattyAI ',
                        style: Style().bodyLargeSemiBold,
                      ),
                      TextSpan(
                        text: 'Public Agreement, Terms, & Privacy Policy.',
                        style: Style()
                            .bodyLargeSemiBold
                            .copyWith(color: Style.primaryColor),
                      ),
                    ])),
         ),
        ],
      ),
      SizedBox(height: 32.h),
      Divider(),
      SizedBox(height: 32.h,),
      Padding(
        padding: const EdgeInsets.only(left: 85),
        child: Row(
          children: [
            Text('Already have an account?'),
            Text('  Log in',style: Style().bodyLargeBold.copyWith(color: Style.primaryColor))
          ],
        ),
      ),
      SizedBox(height: 32,),
      Row(
        children: [
          Expanded(child: Divider()),
          Text('or continue with'),
          Expanded(child: Divider()),
        ],
      ),
      SizedBox(height: 24.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.grey.withOpacity(0.2)
              ),
              borderRadius: BorderRadius.circular(100)
    
            ),
            padding: EdgeInsets.symmetric(horizontal: 46.w,vertical: 18.h),
            child: Image.asset(ImageConstant.icGoogle)),
             Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.grey.withOpacity(0.2)
              ),
              borderRadius: BorderRadius.circular(100)
    
            ),
            padding: EdgeInsets.symmetric(horizontal: 46.w,vertical: 18.h),
            child: Image.asset(ImageConstant.icApple)),
             Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.grey.withOpacity(0.2)
              ),
              borderRadius: BorderRadius.circular(100)
    
            ),
            padding: EdgeInsets.symmetric(horizontal: 46.w,vertical: 18.h),
            child: Image.asset(ImageConstant.icFacebook)),
           
            
        ],
      ),
       SizedBox(height: 35.h,),
       Divider(color: Colors.grey),
       SizedBox(height: 24.h,),
      RadiusButton(
              
              text: 'Continue'.tr,
              fontSize: 18,
              isFullWidth: true,
              maxWidth: double.maxFinite,
              textColor: Colors.white,
              backgroundColor: Style.primaryColor,
              radius: 100,
              innerPadding: EdgeInsets.symmetric(vertical: 24),
              onTap: () {
                  customDialog(context,
                      isLoading: controller.isLoading.value,
                      icon: Image.asset(ImageConstant.icLogSuccess),
                      textConfirmColor: Colors.red,
                      text: "Sig Up Successful!");
                  Future.delayed(Duration(seconds: 1), () {
                    controller.isLoading.value = false;
                    if (controller.isLoading.value == false) {
                      Get.back();
                      Get.toNamed(AppRoutes.home);
                    }
                    // Đóng hộp thoại.
                  });
                },
            )
          ],
        ),
      ),
      ),
    );
  }
}
