import 'package:ai_chat_flutter/constants/app_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/verification/verification_controller.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/screen_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class VerificationPage extends GetView<VerificationController> {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: BASE_WIDTH, allowFontScaling: true)
      ..init(context);
    return  Scaffold(
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
            Text('OTP code verification 🔐', style: Style().h3Bold,),
            SizedBox(height: 16.h,),
            Text('We have sent an OTP code to your email and********ley@yourdomain.com. Enter the OTP code below to verify.',style: Style().bodyXLargeRegular,),
            SizedBox(height: 66.h,),
           _buildPinCode(context),
           SizedBox(height: 40.h,),
Center(child: Text('Didn’t receive email?',style: Style().bodyXLarge,)),
SizedBox(height: 16.h,),
Obx(() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'You can resend code in ',
      style: Style().bodyXLarge,
    ),
    GestureDetector(
      onTap: () {
        if (!controller.showButtons.value) {
          controller.countdownSeconds.value = 5;
          controller.startCountdown();
          controller.showButtons.value = true;
        };
        if(controller.countdownSeconds.value ==0){
          controller.showButtons.value = false;
        }
        
      },
      child: Text(
        controller.showButtons.value == false
            ? 'gửi lại mã '
            : '${controller.countdownSeconds.value} s',
        style: controller.showButtons.value == false
            ? Style().bodyXLarge.copyWith(color: Colors.green)
            : Style().bodyXLarge.copyWith(color: Colors.green),
      ),
    ),
  ],
)),

          ],
        ),
      ),
      );

  }
   Widget _buildPinCode(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: PinCodeTextField(
            controller: controller.otpController,
            autoFocus: true,
            keyboardType: TextInputType.number,
            appContext: context,
            length: 4,
            obscureText: false,
            
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              borderWidth: 1,
              borderRadius: BorderRadius.circular(16),
              activeColor: Style.primaryColor,
              activeFillColor: Colors.white,
              selectedColor: Style.primaryColor,
              selectedFillColor: Colors.white,
              inactiveColor: Style.greyscale50,
              inactiveFillColor: Color(0xffEEEEEE),
              shape: PinCodeFieldShape.box,
              fieldHeight: 60.w,
              fieldWidth: 60.w,
            ),
            animationDuration: const Duration(milliseconds: 300),
            textStyle: Style().bodyLargeBold,
            enableActiveFill: true,
            onCompleted: (v) {
            },
            beforeTextPaste: (text) => true,
            // onChanged: _viewModel.setColor,
          ),
        ),
      ],
    );
  }
}
