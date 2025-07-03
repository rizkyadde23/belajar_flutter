import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleWare extends GetMiddleware{
  final box = GetStorage();
  @override
    RouteSettings? redirect(String? route) {
    bool isLoggedIn = box.read('isLoggedIn') ?? false; //Cek Keadaan Login
    if (!isLoggedIn) {
      return const RouteSettings(name: '/login'); //Arahkan Ke Login
    }
    return null;
  }
}