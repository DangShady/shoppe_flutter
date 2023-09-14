import 'package:ai_chat_flutter/page/create_password/create_password.dart';
import 'package:ai_chat_flutter/page/home/home.dart';
import 'package:ai_chat_flutter/page/login/login.dart';
import 'package:ai_chat_flutter/page/verification/verification.dart';
import 'package:ai_chat_flutter/page/resetpassword/resetpassword.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.login;

  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.verification,
      page: () => VerificationPage(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: AppRoutes.create_password,
      page: () => const CreatepasswordPage(),
      binding: CreatepasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.resetpassword,
      page: () => const ResetpasswordPage(),
      binding: ResetpasswordBinding(),
    ),
  ];
}
