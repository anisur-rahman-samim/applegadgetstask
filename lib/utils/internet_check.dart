import 'package:get/get.dart';
import 'package:applegadgetstask/modules/splash/controller/splash_controlle.dart';

class InternetCheck {
  static void init() {
    Get.put<SplashController>(SplashController(), permanent: true);
  }
}
