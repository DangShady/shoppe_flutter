import 'dart:io';

import 'package:ai_chat_flutter/constants/image_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/account/account_controller.dart';
import 'package:ai_chat_flutter/routes/app_pages.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AccountController());
    return Material(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Account",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImageConstant.logoChatGPT,
                  width: 24.w,
                  height: 24.h,
                )),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      controller.selectedImage != null
                          ? Image.file(controller.selectedImage!)
                          : Image.asset(
                              ImageConstant.icProfile,
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Andrew Ainsley',
                              style: Style().h5Bold,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(
                              'andrew.ainsley@yourdomain.com',
                              style: Style().bodyMediumSemiBold,
                            )
                          ],
                        ),
                      ),
                      const Icon(Icons.navigate_next),
                    ],
                  ),
                  SizedBox(height: 28.h),
                  Container(
                      width: 382.w,
                      height: 112.h,
                      decoration: BoxDecoration(
                        color: Style.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Image.asset(
                                  ImageConstant.logoUpdatePro,
                                  width: 83.w,
                                  height: 80.h,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 27.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upgrade to PRO!',
                                  style: Style()
                                      .h5Bold
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'Enjoy all benefits without restrictions',
                                  style: Style()
                                      .bodySmallMedium
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Image.asset(
                            ImageConstant.nextWhile,
                            width: 24.w,
                            height: 24.w,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'General',
                        style: Style()
                            .bodyMediumSemiBold
                            .copyWith(color: Color(0xff9E9E9E)),
                      ),
                      SizedBox(
                        width: 16.h,
                      ),
                      const Divider(),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ...controller.listGeneral.map((e) => GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 24.h),
                          child: item(
                              icon: e['icon'],
                              title: e["title"],
                              subTitle: e['subTitle']),
                        ),
                        onTap: () {
                          switch (controller.listGeneral.length) {
                            case 1:
                              Get.toNamed(AppRoutes.login);
                              // code block
                              break;
                            case 2:
                              Get.toNamed(AppRoutes.login);
                              // code block
                              break;
                            case 3:
                              Get.toNamed(AppRoutes.login);
                              // code block
                              break;
                            default:
                            // code block
                          }
                        },
                      )),
                  Row(
                    children: [
                      Text(
                        'About',
                        style: Style()
                            .bodyMediumSemiBold
                            .copyWith(color: Color(0xff9E9E9E)),
                      ),
                      SizedBox(
                        width: 16.h,
                      ),
                      Expanded(child: const Divider()),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Column(
                      children: List.generate(
                    controller.listAbout.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: item(
                          icon: controller.listAbout[index]["icon"],
                          title: controller.listAbout[index]["title"],
                          isShow: index == 3 ? true : false),
                    ),
                  ))
                ],
              ),
            ),
          )),
    );
  }

  Widget item({
    required String icon,
    required String title,
    String subTitle = "",
    Function()? onTap,
    bool isShow = false,
  }) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 24.w,
          height: 24,
        ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
            child: Text(
          title,
          style: Style().h6Bold,
        )),
        Text(
          subTitle,
          style: Style().h6Bold,
        ),
        SizedBox(
          width: 20.w,
        ),
        isShow == false
            ? GestureDetector(
                onTap: onTap, child: Icon(Icons.keyboard_arrow_right))
            : SizedBox()
      ],
    );
  }
}
