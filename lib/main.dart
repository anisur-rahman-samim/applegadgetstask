import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:applegadgetstask/utils/internet_check.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage().initStorage;
  InternetCheck.init();
  runApp(const MyApp());
}
