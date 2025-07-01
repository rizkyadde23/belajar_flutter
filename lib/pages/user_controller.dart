import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController{
  final namaController = TextEditingController();
  final nimController = TextEditingController();
  final box = GetStorage();
  var daftar = <Map<String,String>>[].obs;

  @override
  void onInit(){
    super.onInit();
    List stored = box.read('mahasiswa')??[];
    daftar.value = List<Map<String, String>>.from(stored);
  }

  void simpan(){
    final nama = namaController.text;
    final nim = nimController.text;

    if (namaController.text.isNotEmpty & nimController.text.isNotEmpty) {
      final newData = {'nama' : nama, 'nim': nim};
      daftar.add(newData);
      box.write('mahasiswa', daftar);
      namaController.clear();
      nimController.clear();
      Get.snackbar("Berhasil", "Data Telah Disimpan");
    } else {
      Get.snackbar("Peringatan", "Field Tidak Boleh Kosong");
    }
  }

  void hapus(int index){
    daftar.removeAt(index);
    box.write('mahasiswa', daftar);
  }

  void reset(){
    namaController.clear();
    nimController.clear();
  }

  @override
  void onClose(){
    namaController.dispose();
    nimController.dispose();
    super.onClose();
  }
}