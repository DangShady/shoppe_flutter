import 'package:ai_chat_flutter/constants/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final indexPage=0.obs;
  final PageController pageController = PageController();
  final List<String> pages = [
    ImageConstant.logoChat,
    ImageConstant.logoAiAsstant,
    ImageConstant.logoAccount,
  ];

  final List<String> title = [
    "The best AI Chatbot app in this century",
    "Various AI Assistants to help you more",
    "Try premium for your unlimited usage",

  ];
}
