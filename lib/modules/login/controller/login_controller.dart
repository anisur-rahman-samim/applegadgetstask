import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:applegadgetstask/common/storage.dart';
import 'package:applegadgetstask/modules/login/repository/login_repo.dart';
import 'package:applegadgetstask/routes/app_routes.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  @override
  void onInit() {
    emailController.value =
        TextEditingController(text: storage.read(StoreKeys.emailId));
    passwordController.value =
        TextEditingController(text: storage.read(StoreKeys.password));
    super.onInit();
  }

  dynamic login() async {
    isLoading.value = true;
    var response = await LoginRepo.login(
      email: emailController.value.text.trim(),
      password: passwordController.value.text.trim(),
    );
    if (response.result == true) {
      storage.write(StoreKeys.apiToken, response.token);
      storage.write(StoreKeys.emailId, emailController.value.text);
      storage.write(StoreKeys.password, passwordController.value.text);
      Get.offAllNamed(AppRoutes.mainScreen);
      Get.snackbar("Success", "Login Successfully");
      isLoading.value = false;
    } else {
      Get.snackbar("Error", "Login Unsuccessfull");
      isLoading.value = false;
    }
  }
}
