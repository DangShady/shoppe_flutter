import 'package:ai_chat_flutter/page/home/home.dart';
import 'package:ai_chat_flutter/page/profile/profile.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => ProfileController());
  }
}
