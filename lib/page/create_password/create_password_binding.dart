import 'package:ai_chat_flutter/page/create_password/create_password_controller.dart';
import 'package:get/get.dart';

class CreatepasswordBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => CreatepasswordController() );
  }
}
