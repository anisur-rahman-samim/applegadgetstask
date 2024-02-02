import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:applegadgetstask/common/app_assets.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(AppAssets.noInternet),
              const Text("Check internet connection"),
            ],
          ),
        ),
      ),
    );
  }
}
