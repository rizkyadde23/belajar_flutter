import 'package:belajar/pages/app_routes.dart';
import 'package:belajar/pages/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/app_pages.dart';


void main() async {
  await GetStorage.init();
  Get.put(UserController()); // inisiasi controller
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    )
  );
}