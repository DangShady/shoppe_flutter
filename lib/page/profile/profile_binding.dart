import 'package:ai_chat_flutter/page/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController() );
  }
}
