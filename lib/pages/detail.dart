import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';

class DetailPage extends StatelessWidget{
  DetailPage({super.key});
  final list = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),leading: IconButton(onPressed: Get.back, icon: Icon(Icons.arrow_back)),),
      body: 
        Obx((){
          final data = list.daftar;
          return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index){
          final item = data[index];
          return Card(
                  child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("NAMA : ${item['nama']}"),
                  subtitle: Text('${item['nim']}'),
                  trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => list.hapus(index),
              ),
            ),
          );
        });
        }),
      );
  }
}