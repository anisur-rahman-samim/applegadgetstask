import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:applegadgetstask/common/app_colors.dart';
import 'package:applegadgetstask/common/app_text_style/styles.dart';
import 'package:applegadgetstask/common/loader.dart';
import 'package:applegadgetstask/modules/trades/controller/trade_controller.dart';
import 'package:applegadgetstask/modules/trades/model/trade_model.dart';
import 'package:applegadgetstask/routes/app_routes.dart';
import 'package:applegadgetstask/utils/responsive.dart';

class TradesScreen extends StatelessWidget {
  TradesScreen({super.key});

  final TradeController controller = Get.put(TradeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainColor,
        title:  Text("Trades",style: h2.copyWith(color: AppColors.white)),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: state!.length,

              itemBuilder: (context, index) {
                TradeModel trade = state[index];

                if (state.isNotEmpty) {
                  return _buildTradeCard(trade);
                }
                return const Center(
                  child: Text("server Error"),
                );
              },
            ),
            verticalSpace(20),
            state.isEmpty
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Total Profit: ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(controller.calculateProfit().toStringAsFixed(2)),
                    ],
                  )
          ],
        ),
        onEmpty: const Center(
          child: Text("Trades are empty"),
        ),
        onLoading: const Loader(),
        onError: (error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Token expired login again"),
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.loginScreen);
                  },
                  child: const Text("Go to login screen"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTradeCard(TradeModel trade) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(child: Text(trade.digits.toString())),
          title: Row(
            children: [
               Text('Current price:',style: h2,),
              Text(
                trade.currentPrice!.toStringAsFixed(3),
              ),
            ],
          ),
          subtitle: Row(
            children: [
               Text('Ticket: ',style: h2,),
              Text(trade.ticket.toString(),),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text('Profit',style: h2,),
              Text(trade.profit!.toStringAsFixed(2)),
            ],
          ),
        ),
      ),
    );
  }
}
