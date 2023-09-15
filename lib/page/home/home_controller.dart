import 'package:ai_chat_flutter/page/account/account_page.dart';
import 'package:ai_chat_flutter/page/profile/profile.dart';
import 'package:ai_chat_flutter/style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var currentTab = 0.obs;
  List<Widget> children = [
    Center(
      child: Text(
        "Home View",
        style: Style().h1Bold,
      ),
    ),
    Center(
      child: Text("AI Assistants", style: Style().h1Bold),
    ),
    Center(
      child: Text("History", style: Style().h1Bold),
    ),
    const AccountPage()
  ];

  void switchTab(index) {
    currentTab.value = index;
  }

  Widget get currentPage => children[currentTab.value];
}
