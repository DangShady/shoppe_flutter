
import 'package:ai_chat_flutter/page/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController() );
  }
}
