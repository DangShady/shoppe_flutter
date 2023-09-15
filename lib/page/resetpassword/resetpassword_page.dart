import 'package:ai_chat_flutter/constants/app_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/resetpassword/resetpassword_controller.dart';
import 'package:ai_chat_flutter/routes/app_pages.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:ai_chat_flutter/widget/button_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/screen_util.dart';

class ResetpasswordPage extends GetView<ResetpasswordController> {
  const ResetpasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: BASE_WIDTH, allowFontScaling: true)
      ..init(context);
    return  Scaffold(
        resizeToAvoidBottomInset: false,
    
      body: Column(
        children: [
          Expanded(
            child: Container(
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
                  Text('Reset your password 🔑', style: Style().h3Bold,),
                  SizedBox(height: 16.h,),
                  Text('Please enter your email and we will send an OTP code in the next step to reset your password.',style: Style().bodyXLargeRegular,),
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
                ],
              ),
            ),
          ),
          const Divider(),
          SizedBox(height: 24.h,),
          RadiusButton(
                  text: 'Contiune'.tr,
                  fontSize: 18,
                  isFullWidth: true,
                  maxWidth: double.maxFinite,
                  textColor: Colors.white,
                  backgroundColor: Style.primaryColor,
                  radius: 100,
                  innerPadding: EdgeInsets.symmetric(vertical: 24),
                  onTap: () {
                      Get.toNamed(AppRoutes.verification);
                    },
                ),
                SizedBox(height: 36.h,),
        ],
      ),
      );
  }
}
