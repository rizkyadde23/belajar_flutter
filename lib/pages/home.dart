import 'package:belajar/pages/app_routes.dart';
import 'package:belajar/pages/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget{
  HomePage ({super.key});
  final dataController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation+GetStorage"),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: dataController.namaController,
            decoration: InputDecoration(labelText: "NAMA"),
          ),
          const SizedBox(height: 12,),
          TextField(
            controller: dataController.nimController,
            decoration: InputDecoration(labelText: "NIM"),
          ),
          const SizedBox(height: 12,),
          ElevatedButton(
          onPressed: dataController.simpan, 
          child: Text("Simpan")),
          const SizedBox(height: 12,),
          ElevatedButton(
          onPressed: dataController.reset, 
          child: Text("Reset")),
          const SizedBox(height: 12,),
          ElevatedButton(
          onPressed: (){Get.toNamed(AppRoutes.detail);}, 
          child: Text("Detail")),
        ],
      ),
      ),
    );
  }
}