import 'package:get/get.dart';

import 'introduction_controller.dart';

class IntroductionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroductionController());
  }
}
