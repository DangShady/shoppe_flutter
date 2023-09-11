import 'package:ai_chat_flutter/page/home/home.dart';
import 'package:ai_chat_flutter/page/login/login.dart';
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
  ];
}
