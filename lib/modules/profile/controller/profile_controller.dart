import 'package:get/get.dart';
import 'package:applegadgetstask/modules/profile/model/profile_model.dart';
import 'package:applegadgetstask/modules/profile/repository/profile_repo.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profile = ProfileModel().obs;
  var lastDigit = ''.obs;

  Future<ProfileModel> getProfileData() async {
    isLoading.value = true;
    var response = await ProfileRepo.getProfile();
    profile.value = response;
    isLoading.value = false;
    return profile.value;
  }

  void getPhoneNumber() async {
    isLoading.value = true;
    var data = await ProfileRepo.getPhoneNumber();
    lastDigit.value = data;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getProfileData();
    getPhoneNumber();
    super.onInit();
  }
}
