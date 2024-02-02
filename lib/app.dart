import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:applegadgetstask/common/app_colors.dart';
import 'package:applegadgetstask/modules/main/bindings/mainbindings.dart';
import 'package:applegadgetstask/routes/app_pages.dart';
import 'package:applegadgetstask/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBindigns(),
      title: 'Apple Gadgets Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.routes,
    );
  }
}
