import 'package:ai_chat_flutter/constants/app_constant.dart';
import 'package:ai_chat_flutter/constants/image_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/create_password/create_password_controller.dart';
import 'package:ai_chat_flutter/routes/app_pages.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:ai_chat_flutter/widget/button_with_icon.dart';
import 'package:ai_chat_flutter/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/screen_util.dart';

class CreatepasswordPage extends GetView<CreatepasswordController> {
  const CreatepasswordPage({super.key});

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
            Text('Create New Password 🔒', style: Style().h3Bold,),
            SizedBox(height: 16.h,),
            Text('Create your new password. If you forget it, then you have to do forgot password.',style: Style().bodyXLargeRegular,),
            SizedBox(height: 32.h,),
            Text('New Password', style: Style().bodyLargeBold),
            SizedBox(height: 16.h,),
            TextFormField(
              obscureText: true,
              style: Style().h5Bold,
              decoration: InputDecoration(
                hintText: 'New Password',
               suffixIcon: Image.asset(ImageConstant.icNoEye),
               hintStyle: Style().h5Bold.copyWith(color: Color(0xff9E9E9E)),
              ),
            ),
            SizedBox(height: 24.h,),
            Text('Confirm New Password', style: Style().bodyLargeBold,),
            SizedBox(height: 16.h,),
            TextFormField(
              style: Style().h5Bold,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm New Password',
                hintStyle: Style().h5Bold.copyWith(color: Color(0XFF9E9E9E)),
                suffixIcon: Image.asset(ImageConstant.icNoEye)
              ),
            ),
      SizedBox(height: 328.h,),
Divider(),
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
                      icon: Image.asset(ImageConstant.icCreatPw),
                      textConfirmColor: Colors.red,
                      text: "Reset Password Successful!");
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
