import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:applegadgetstask/common/no_internet_screen.dart';
import 'package:applegadgetstask/routes/app_routes.dart';

import '../../../common/storage.dart';

class SplashController extends GetxController {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.to(() => const NoInternetScreen());
      Get.rawSnackbar(
          messageText: const Text('PLEASE CONNECT TO THE INTERNET',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        storage.read(StoreKeys.apiToken) == null
            ? Get.toNamed(AppRoutes.loginScreen)
            : Get.offAllNamed(AppRoutes.mainScreen);

        Get.closeCurrentSnackbar();
      }
    }
  }

  navigateTo() async {
    await Future.delayed(const Duration(seconds: 2)).then((_) async {
      if (storage.read('token') != null) {
        Get.offAllNamed(AppRoutes.mainScreen);
      } else {
        Get.offAllNamed(AppRoutes.loginScreen);
      }
    });
  }

  @override
  void onClose() {
    connectivitySubscription!.cancel();
    super.onClose();
  }
}
