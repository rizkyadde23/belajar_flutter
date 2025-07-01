import 'package:belajar/pages/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget{
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    return Scaffold(
      appBar: AppBar(title: Text("Binding"),),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
            TextField(
            controller: controller.namaController,
            decoration: InputDecoration(label: Text("NAMA")),
          ),
          const SizedBox(height: 12,),
            TextField(
            controller: controller.nimController,
            decoration: InputDecoration(label: Text("NIM")),
          ),
          ElevatedButton(onPressed: (){
            controller.kirim();
          }, child: Text("Kirim")),
          ElevatedButton(onPressed: (){
            controller.reset();
          }, child: Text("Reset")) 
        ],
      ),
      )
    );

  }

}