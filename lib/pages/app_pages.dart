import 'package:get/get.dart';
import 'package:belajar/pages/home.dart';
import 'package:belajar/pages/detail.dart';
import 'app_routes.dart';

class AppPages{
  static final routes = [
    GetPage(name: AppRoutes.home, page: ()=>HomePage()),
    GetPage(name: AppRoutes.detail, page: ()=>DetailPage())
  ];
}