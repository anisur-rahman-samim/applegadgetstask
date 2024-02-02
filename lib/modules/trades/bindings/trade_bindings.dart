import 'package:get/get.dart';
import 'package:applegadgetstask/modules/trades/controller/trade_controller.dart';

class TradesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TradeController());
  }
}
