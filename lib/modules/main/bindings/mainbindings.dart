import 'package:get/get.dart';
import 'package:applegadgetstask/modules/main/controller/nav_controller.dart';
import 'package:applegadgetstask/modules/splash/controller/splash_controlle.dart';
import 'package:applegadgetstask/modules/trades/controller/trade_controller.dart';

class MainBindigns extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavController());
    Get.lazyPut(() => TradeController());
    Get.put(SplashController());
  }
}
