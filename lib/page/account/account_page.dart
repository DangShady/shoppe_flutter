import 'package:ai_chat_flutter/constants/image_constant.dart';
import 'package:ai_chat_flutter/helpers/extension/responsive.dart';
import 'package:ai_chat_flutter/page/account/account_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AccountPage extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
          body: Column(
        children: [
          item(icon: ImageConstant.icCboxTrue, title: "xxxx"),
          item(icon: ImageConstant.icCboxTrue, title: "xxxx"),
          item(icon: ImageConstant.icCboxTrue, title: "xxxx"),
        ],
      )),
    );
  }

  Widget item({required String icon, required String title}) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 24.w,
          height: 24,
        ),
        Text(title),
        Icon(Icons.arrow_right)
      ],
    );
  }
}
