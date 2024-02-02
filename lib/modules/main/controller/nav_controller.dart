import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:applegadgetstask/modules/logout/logout_screen.dart';
import 'package:applegadgetstask/modules/profile/profile_screen.dart';
import 'package:applegadgetstask/modules/trades/trades_screen.dart';

class NavController extends GetxController {
  var index = 0.obs;

  List<Widget> screens = [
    TradesScreen(),
    ProfileScreen(),
    const LogoutScreen(),
  ];

  changeIndex(int i) {
    index.value = i;
    update();
  }
}
