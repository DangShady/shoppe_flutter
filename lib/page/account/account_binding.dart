import 'package:ai_chat_flutter/page/account/account_controller.dart';
import 'package:get/get.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
