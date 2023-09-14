import 'package:ai_chat_flutter/page/welcom_screen/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
