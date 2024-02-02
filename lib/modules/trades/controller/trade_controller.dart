import 'package:get/get.dart';
import 'package:applegadgetstask/modules/trades/model/trade_model.dart';
import 'package:applegadgetstask/modules/trades/repository/trades_repo.dart';

class TradeController extends GetxController with StateMixin {
  var trades = <TradeModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getTrades();
    super.onInit();
  }

  void getTrades() async {
    RxStatus.loading();
    await TradesRepo.getTrades().then((value) {
      change(value, status: RxStatus.success());
    }).catchError((onError) {
      change(onError, status: RxStatus.error());
    });
  }

  double calculateProfit() {
    double totalProfit = 0.0;

    List<dynamic> profit = state.map((element) => element.profit).toList();

    for (var i in profit) {
      totalProfit = totalProfit + i!;
    }
    return totalProfit;
  }
}
