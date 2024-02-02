import 'package:get/get.dart';
import 'package:applegadgetstask/api/base_client.dart';
import 'package:applegadgetstask/modules/login/model/login_model.dart';

import 'package:dio/dio.dart' as dio;
import 'package:applegadgetstask/utils/urls.dart';

import '../controller/login_controller.dart';

final LoginController loginController = Get.put(LoginController());

class LoginRepo {
  static Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    var data = {'login': email, 'password': password};
    try {
      dio.Response response =
          await BaseClient.post(url: Urls.login, payload: data);
      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(response.data);
        return loginModel;
      } else {
        loginController.isLoading.value = false;
        Get.snackbar('Error', "${response.statusMessage}");
      }
      throw "${response.statusMessage}";
    } catch (e) {
      rethrow;
    }
  }
}
