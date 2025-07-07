import 'package:belajar/pages/app_pages.dart';
import 'package:belajar/pages/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('mahasiswaBox');
  await Hive.openBox('loginBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp ({super.key});
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );    
  }
}

