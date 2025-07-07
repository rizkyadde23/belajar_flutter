import 'package:belajar/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget{
  const HomePage ({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final Box mhsBox = Hive.box('mahasiswaBox');
  final Box loginBox = Hive.box('loginBox');
  final formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();

  void simpanData() {
    final nama = namaController.text.trim();
    final nim = nimController.text.trim();

    if (nama.isNotEmpty && nim.isNotEmpty) {
      Get.snackbar("Berhasil", "Data Telah Disimpan");
      mhsBox.add({'nama': nama, 'nim': nim});
      namaController.clear();
      nimController.clear();
      setState(() {});
    }
  }

  void delete(int index){
    mhsBox.deleteAt(index);
    Get.back();
    setState(() {
      
    });
  }

  void logout(){
    loginBox.put('isLoggedIn', false);
    Get.offAll(LoginPage());
    Get.snackbar("Berhasil", 'Logout Berhasil');
  }

  @override
  Widget build(BuildContext context) {
    final data = mhsBox.values.whereType<Map>().toList();
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
        body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(labelText: "Masukkan Nama"),
                  validator: (value) => value!.isEmpty ? "Nama Tidak Boleh Kosong " : null,
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  controller: nimController,
                  decoration: InputDecoration(labelText: "Masukkan Nim"),
                  validator: (value) => value!.isEmpty ? "NIM Tidak Boleh Kosong " : null,
                ),
              ],
              ),
            ),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: (){
              if (formKey.currentState!.validate()) {
                simpanData();
              }
            }, child: Text("Simpan")),
            const SizedBox(height: 12,),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  final item = data[index];
                  return Card(
                    child: ListTile(
                      title: Text('${item['nama']}'),
                      subtitle: Text('${item['nim']}'),
                      leading: Icon(Icons.person),
                      trailing: IconButton(
                        onPressed: (){
                          Get.defaultDialog(
                            title: "Konfirmasi",
                            middleText: "Yakin Ingin Menghapus Data?",
                            textConfirm: "Ya",
                            textCancel: "Tidak",
                            confirmTextColor: Colors.white,
                            onConfirm: (){
                              delete(index);
                            },
                            onCancel: Get.back,
                            barrierDismissible: false,
                          );
                        },
                        icon: Icon(Icons.delete)),
                    ),
                  );
                }
                ),
            )       
          ],
        ),
        )
    );    
  }
}