import 'package:belajar/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget{
  HomePage ({super.key});
  final box = GetStorage();

  void logout(){
    box.write('isLoggedIn', false);
    Get.offAll(LoginPage());
    Get.snackbar("Berhasil", 'Logout Berhasil');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: (){
              Get.defaultDialog(
                title: "Konfirmasi",
                middleText: "Yakin Ingin Keluar?",
                textConfirm: "Ya",
                textCancel: "Tidak",
                confirmTextColor: Colors.white,
                onConfirm: (){
                  logout();
                },
                onCancel: Get.back,
                barrierDismissible: false,
              );
            },
            icon: Icon(Icons.logout),
        ),
        ]
        ),
        body: Center(
        child: Text("Selamat Datang Di Home Page"),
      ),
    );    
  }
}