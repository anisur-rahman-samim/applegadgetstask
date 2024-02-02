import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:applegadgetstask/api/base_client.dart';
import 'package:applegadgetstask/common/storage.dart';
import 'package:dio/dio.dart' as dio;
import 'package:applegadgetstask/modules/trades/controller/trade_controller.dart';
import 'package:applegadgetstask/modules/trades/model/trade_model.dart';
import 'package:applegadgetstask/utils/urls.dart';

class TradesRepo {
  static Future<List<TradeModel>> getTrades() async {
    var data = {
      'login': storage.read(StoreKeys.emailId),
      'token': storage.read(StoreKeys.apiToken).toString(),
    };
    debugPrint(data.toString());
    try {
      dio.Response response =
          await BaseClient.post(url: Urls.trades, payload: data);

      if (response.statusCode == 200) {
        List trades = response.data;
        List<TradeModel> tradeList = [];
        for (var i in trades) {
          tradeList.add(TradeModel.fromJson(i));
        }
        return tradeList;
      }
      throw '${response.statusCode}+ ${response.statusMessage}';
    } on dio.DioException catch (e) {
      if (e.type == dio.DioExceptionType.badResponse) {
        Get.find<TradeController>().isLoading.value = false;
      } else {
        Get.find<TradeController>().isLoading.value = false;
      }
      rethrow;
    }
  }
}
