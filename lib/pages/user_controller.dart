import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final namaController = TextEditingController();
  final nimController = TextEditingController();
  var nama = ''.obs;
  var nim = ''.obs;

  @override
  void onInit() {
    super.onInit();
    namaController.addListener((){
      nama.value = namaController.text;
    });
    nimController.addListener((){
      nim.value = nimController.text;
    });
  }

  void kirim(){
    if (nama.value.isNotEmpty && nim.value.isNotEmpty) {
      Get.snackbar("input", "Nama : ${namaController.text} (${nimController.text})");
      namaController.clear();
      nimController.clear();
    }
  }

  void reset(){
    nama.value ='';
    nim.value ='';
    namaController.clear();
    nimController.clear();
  }
  
  @override
  void onClose() {
    namaController.dispose();
    nimController.dispose();
    super.onClose();
  }

}
