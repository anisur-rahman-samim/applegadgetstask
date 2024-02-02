import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:applegadgetstask/common/app_colors.dart';
import 'package:applegadgetstask/common/app_text_style/styles.dart';
import 'package:applegadgetstask/common/loader.dart';
import 'package:applegadgetstask/modules/profile/controller/profile_controller.dart';
import 'package:applegadgetstask/utils/responsive.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainColor,
        title:  Text("Profile",style: h2.copyWith(color: AppColors.white)),
        centerTitle: true,
      ),
      body: Obx(() => profileController.isLoading.value
          ? const Loader()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColors.mainColor,
                          child: Center(
                            child: Text(profileController.profile.value.name!.substring(0,1),style: h1.copyWith(fontSize: 62,color: AppColors.white),),
                          ),
                        ),
                        Text(profileController.profile.value.name.toString(),style: h2,),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02,),

                  buildRowData(
                      title: "Balance",
                      value: profileController.profile.value.balance.toString()),
                  buildRowData(
                      title: "Address",
                      value: profileController.profile.value.address),
                  buildRowData(
                      title: "City",
                      value: profileController.profile.value.city),
                  buildRowData(
                      title: "Country",
                      value: profileController.profile.value.country),

                  verticalSpace(30),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Last four numbers of Phone Number"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      profileController.lastDigit.value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )),
    );
  }

  Widget buildRowData({String? title,value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title!),
          Text(value!),
        ],
      ),
    );
  }
}
