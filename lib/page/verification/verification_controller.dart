import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final checkBoxed = false.obs;
  final isLoading=true.obs;
  TextEditingController otpController=TextEditingController();
    late Timer countdownTimer;
  
  // Tạo một RxInt để theo dõi số giây còn lại
  final showButtons = false.obs;
  var countdownSeconds = 5.obs;

  //...

  // Tạo hàm startCountdown để bắt đầu đếm ngược
  void startCountdown() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (countdownSeconds.value == 0) {
          showButtons.value = false; // Đặt showButtons thành false khi countdownSeconds = 0
          timer.cancel(); // Hủy đồng hồ đếm ngược sau khi hoàn thành.
        } else {
          countdownSeconds.value--;
        }
      },
    );
  }

  //...

  // Tạo hàm hủy đếm ngược để hủy bỏ timer khi cần
}
