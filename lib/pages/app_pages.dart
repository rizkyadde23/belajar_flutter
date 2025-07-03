import 'package:belajar/pages/middleware.dart';
import 'package:get/get.dart';
import 'home.dart';
import 'login.dart';
import 'app_routes.dart';

class AppPages{
  static final routes = [
    GetPage(
      name: AppRoutes.home, 
      page:()=> HomePage(),
      middlewares: [AuthMiddleWare()] //Cek Keadaan Middleware
      ),
    GetPage(
      name: AppRoutes.login,
      page: ()=> LoginPage(),
      ),
  ];
}