import 'package:ai_chat_flutter/page/resetpassword/resetpassword_controller.dart';
import 'package:get/get.dart';

class ResetpasswordBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => ResetpasswordController() );
  }
}
