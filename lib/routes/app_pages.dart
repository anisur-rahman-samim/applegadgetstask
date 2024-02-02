import 'package:get/get.dart';
import 'package:applegadgetstask/modules/login/login_screen.dart';
import 'package:applegadgetstask/modules/main/bindings/mainbindings.dart';
import 'package:applegadgetstask/modules/main/main_screen.dart';
import 'package:applegadgetstask/modules/profile/profile_screen.dart';
import 'package:applegadgetstask/modules/splash/splash_screen.dart';
import 'package:applegadgetstask/modules/trades/bindings/trade_bindings.dart';
import 'package:applegadgetstask/modules/trades/trades_screen.dart';
import 'package:applegadgetstask/routes/app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SpalshScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => const MainScreen(),
      binding: MainBindigns(),
    ),
    GetPage(
      name: AppRoutes.tradesScreen,
      page: () => TradesScreen(),
      binding: TradesBindings(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
    ),
  ];
}
