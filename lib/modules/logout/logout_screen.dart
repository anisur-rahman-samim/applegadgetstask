import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:applegadgetstask/common/app_colors.dart';
import 'package:applegadgetstask/common/storage.dart';
import 'package:applegadgetstask/routes/app_routes.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            storage.remove(StoreKeys.apiToken);
            Get.offAllNamed(AppRoutes.loginScreen);
          },
          child: const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.mainColor,
            child: Center(child: Icon(Icons.logout_sharp,size: 50,color: AppColors.white,),),
          ),
        ),
      ),
    );
  }
}
