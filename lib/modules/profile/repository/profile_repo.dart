import 'package:flutter/material.dart';
import 'package:applegadgetstask/api/base_client.dart';
import 'package:applegadgetstask/common/storage.dart';
import 'package:dio/dio.dart' as dio;
import 'package:applegadgetstask/modules/profile/model/profile_model.dart';
import 'package:applegadgetstask/utils/urls.dart';

class ProfileRepo {
  static Future<ProfileModel> getProfile() async {
    var data = {
      'login': storage.read(StoreKeys.emailId),
      'token': storage.read(StoreKeys.apiToken).toString(),
    };
    debugPrint(data.toString());
    try {
      dio.Response response =
          await BaseClient.post(url: Urls.profile, payload: data);

      if (response.statusCode == 200) {
        debugPrint('profile>>>>>>>>>>>> ${response.data}');
        return ProfileModel.fromJson(response.data);
      }
      throw '${response.statusCode}+ ${response.statusMessage}';
    } catch (e) {
      rethrow;
    }
  }

  static Future getPhoneNumber() async {
    var data = {
      'login': storage.read(StoreKeys.emailId),
      'token': storage.read(StoreKeys.apiToken).toString(),
    };
    debugPrint(data.toString());
    try {
      dio.Response response =
          await BaseClient.post(url: Urls.lastFourDigits, payload: data);

      if (response.statusCode == 200) {
        debugPrint('profile>>>>>>>>>>>> ${response.data}');
        return response.data;
      }
      throw '${response.statusCode}+ ${response.statusMessage}';
    } catch (e) {
      rethrow;
    }
  }
}
